import 'package:thameen/features/chat/data/models/chat_model.dart';
import 'package:thameen/features/chat/data/models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<String> createOrGetChat({
    required String currentUserId,
    required String otherUserId,
    required String postId,
  });
  Stream<Map<String, dynamic>> streamUser(String userId);

  Future<void> sendMessage(MessageModel message);

  Stream<List<MessageModel>> getMessages(String chatId);

  Stream<List<ChatModel>> getUserChats(String userId);

  Future<Map<String, dynamic>> getUserData(String userId);

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
  Future<void> resetUnreadCount({
    required String chatId,
    required String userId,
  });
}
