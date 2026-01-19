import 'dart:io';

import 'package:thameen/features/chat/data/models/chat_preview_model.dart';
import 'package:thameen/features/chat/data/models/chat_user_model.dart';
import 'package:thameen/features/chat/data/models/message_model.dart';

abstract class ChatRepository {
  Stream<ChatUserModel> streamChatUser(String userId);

  Future<String> startChat(
    String otherUserId,
    String postId,
    bool isAnonymousChat,
  );

  Stream<List<ChatPreviewModel>> getChats();

  Stream<List<MessageModel>> getMessages(String chatId);

  Future<void> sendMessage(String chatId, String text);
  Future<void> sendImages({
    required String chatId,
    required List<File> images,
  });
  String get currentUserId;

  // 🔹 Message Status
  Future<void> markMessageDelivered({
    required String chatId,
    required String messageId,
  });

  Future<void> markMessageSeen({
    required String chatId,
    required String messageId,
  });

  // 🔹 unreadCount
  Future<void> resetUnreadCount(String chatId);
}
