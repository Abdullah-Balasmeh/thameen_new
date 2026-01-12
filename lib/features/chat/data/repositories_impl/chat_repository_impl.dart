import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:thameen/features/chat/data/models/chat_preview_model.dart';
import 'package:thameen/features/chat/data/models/chat_user_model.dart';
import 'package:thameen/features/chat/data/models/message_model.dart';
import 'package:thameen/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remote;
  final AuthRepo authRepo;

  ChatRepositoryImpl({
    required this.remote,
    required this.authRepo,
  });

  String get _currentUserId {
    final uid = authRepo.currentUserId;
    if (uid == null) {
      throw Exception('User not logged in');
    }
    return uid;
  }

  @override
  Stream<ChatUserModel> streamChatUser(String userId) {
    return remote
        .streamUser(userId)
        .map(
          (data) => ChatUserModel(
            id: data['id'] as String,
            name: '${data['firstName']} ${data['lastName']}',
            avatarUrl: data['photoUrl'] as String?,
            isOnline: data['isOnline'] as bool,
            lastSeen:
                (data['lastSeen'] as Timestamp?)?.toDate() ?? DateTime.now(),
          ),
        );
  }

  @override
  Future<String> startChat(
    String otherUserId,
    String postId,
    bool isAnonymousChat,
  ) {
    return remote.createOrGetChat(
      currentUserId: _currentUserId,
      otherUserId: otherUserId,
      postId: postId,
      isAnonymousChat: isAnonymousChat,
    );
  }

  @override
  Stream<List<ChatPreviewModel>> getChats() {
    return remote.getUserChats(_currentUserId).asyncMap(
      (chats) async {
        if (chats.isEmpty) return [];

        final Map<String, ChatPreviewModel> uniqueChats = {};

        for (final chat in chats) {
          final otherUserId = chat.userIds.firstWhere(
            (id) => id != _currentUserId,
          );

          final userData = await remote.getUserData(otherUserId);
          log('isAnonymousChat: ${chat.isAnonymousChat}');
          final isAnonymous = chat.isAnonymousChat;
          final preview = ChatPreviewModel(
            chatId: chat.id,
            otherUser: ChatUserModel(
              id: userData['id'] as String,
              name: isAnonymous
                  ? 'Anonymous'
                  : '${userData['firstName']} ${userData['lastName']}',
              avatarUrl: userData['photoUrl'] as String?,
              isOnline: (userData['isOnline'] as bool?) ?? false,
              lastSeen:
                  (userData['lastSeen'] as Timestamp?)?.toDate() ??
                  DateTime.now(),
            ),
            lastMessage: chat.lastMessage,
            lastMessageTime: chat.lastMessageTime,
            unreadCount: chat.unreadCount[_currentUserId] ?? 0,
          );

          // ✅ الدمج حسب المستخدم الآخر
          final existing = uniqueChats[otherUserId];

          if (existing == null ||
              preview.lastMessageTime.isAfter(existing.lastMessageTime)) {
            uniqueChats[otherUserId] = preview;
          }
        }

        return uniqueChats.values.toList()..sort(
          (a, b) => b.lastMessageTime.compareTo(a.lastMessageTime),
        );
      },
    );
  }

  @override
  Stream<List<MessageModel>> getMessages(String chatId) {
    return remote.getMessages(chatId);
  }

  @override
  Future<void> sendMessage(String chatId, String text) {
    return remote.sendMessage(
      MessageModel(
        id: '',
        chatId: chatId,
        senderId: _currentUserId,
        text: text,
        createdAt: DateTime.now(),
        status: MessageStatus.sent,
      ),
    );
  }

  @override
  Future<void> markMessageDelivered({
    required String chatId,
    required String messageId,
  }) {
    return remote.markMessageDelivered(
      chatId: chatId,
      messageId: messageId,
    );
  }

  @override
  Future<void> markMessageSeen({
    required String chatId,
    required String messageId,
  }) {
    return remote.markMessageSeen(
      chatId: chatId,
      messageId: messageId,
    );
  }

  @override
  String get currentUserId => authRepo.currentUserId!;
  @override
  Future<void> resetUnreadCount(String chatId) {
    return remote.resetUnreadCount(
      chatId: chatId,
      userId: _currentUserId,
    );
  }
}
