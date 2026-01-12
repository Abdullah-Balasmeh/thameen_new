class ChatModel {
  final String id; // chatId
  final List<String> userIds; // [currentUserId, otherUserId]
  final String postId; // الربط مع البوست
  final String lastMessage;
  final DateTime lastMessageTime;
  final Map<String, int> unreadCount; // { userId : count }
  final DateTime createdAt;
  final bool isAnonymousChat;
  final String anonymousUserId;

  ChatModel({
    required this.id,
    required this.userIds,
    required this.postId,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
    required this.createdAt,
    required this.isAnonymousChat,
    required this.anonymousUserId,
  });
}
