import 'package:thameen/features/chat/data/models/chat_user_model.dart';

class ChatPreviewModel {
  final String chatId;
  final ChatUserModel otherUser;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;

  ChatPreviewModel({
    required this.chatId,
    required this.otherUser,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
  });
}
