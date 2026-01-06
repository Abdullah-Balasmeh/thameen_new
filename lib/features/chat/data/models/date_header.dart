import 'package:thameen/features/chat/data/models/message_model.dart';

abstract class ChatItem {}

class DateHeaderItem extends ChatItem {
  final DateTime date;
  DateHeaderItem(this.date);
}

class MessageItem extends ChatItem {
  final MessageModel message;
  MessageItem(this.message);
}

List<ChatItem> groupMessagesByDay(List<MessageModel> messages) {
  final List<ChatItem> items = [];
  DateTime? lastDate;

  for (final message in messages) {
    final messageDate = DateTime(
      message.createdAt.year,
      message.createdAt.month,
      message.createdAt.day,
    );

    if (lastDate == null || messageDate != lastDate) {
      items.add(DateHeaderItem(messageDate));
      lastDate = messageDate;
    }

    items.add(MessageItem(message));
  }

  return items;
}
