import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/chat/data/models/chat_preview_model.dart';
import 'package:thameen/features/chat/data/models/chat_user_model.dart';
import 'package:thameen/features/chat/data/models/message_model.dart';
import 'package:thameen/features/chat/domain/repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;

  StreamSubscription? _chatListSub;
  StreamSubscription? _messagesSub;

  ChatCubit({required this.chatRepository}) : super(ChatInitial());

  // =========================
  // Chat List
  // =========================
  void loadChats() {
    emit(ChatLoading());

    _chatListSub?.cancel();
    _chatListSub = chatRepository.getChats().listen(
      (chats) {
        emit(ChatListLoaded(chats));
      },
      onError: (_) {
        emit(ChatError('Failed to load chats'));
      },
    );
  }

  // =========================
  // Chat Messages (Detail)
  // =========================
  void loadMessages(String chatId) {
    _messagesSub?.cancel();

    _messagesSub = chatRepository
        .getMessages(chatId)
        .listen(
          (messages) async {
            emit(ChatMessagesLoaded(messages));

            final currentUserId = chatRepository.currentUserId;

            bool hasSeenUpdates = false;

            for (final msg in messages) {
              if (msg.senderId != currentUserId) {
                // SENT → DELIVERED
                if (msg.status == MessageStatus.sent) {
                  await chatRepository.markMessageDelivered(
                    chatId: chatId,
                    messageId: msg.id,
                  );
                }

                // DELIVERED → SEEN
                if (msg.status == MessageStatus.delivered) {
                  await chatRepository.markMessageSeen(
                    chatId: chatId,
                    messageId: msg.id,
                  );
                  hasSeenUpdates = true;
                }
              }
            }

            // 🔥 فقط إذا في رسائل تغيرت لـ SEEN
            if (hasSeenUpdates) {
              await chatRepository.resetUnreadCount(chatId);
            }
          },
          onError: (_) {
            emit(ChatError('Failed to load messages'));
          },
        );
  }

  // =========================
  // Send Message
  // =========================
  Future<void> sendMessage({
    required String chatId,
    required String text,
  }) async {
    if (text.trim().isEmpty) return;
    await chatRepository.sendMessage(chatId, text);
  }

  // =========================
  // Start chat
  // =========================
  Future<String> startChat({
    required String otherUserId,
    required String postId,
  }) async {
    return await chatRepository.startChat(otherUserId, postId);
  }

  @override
  Future<void> close() {
    _chatListSub?.cancel();
    _messagesSub?.cancel();
    return super.close();
  }
}
