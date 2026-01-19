class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String? text;
  final List<String>? imageUrls;
  final DateTime createdAt;
  final MessageStatus status;
  final MessageType type;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.createdAt,
    required this.status,
    required this.type,
    this.text,
    this.imageUrls,
  });
}

enum MessageStatus {
  sent,
  delivered,
  seen,
}

enum MessageType { text, image }
