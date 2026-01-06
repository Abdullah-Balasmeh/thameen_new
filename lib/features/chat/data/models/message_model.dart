class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String text;
  final DateTime createdAt;
  final MessageStatus status;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.text,
    required this.createdAt,
    required this.status,
  });
}

enum MessageStatus {
  sent,
  delivered,
  seen,
}
