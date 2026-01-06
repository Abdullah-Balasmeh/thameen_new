import 'package:intl/intl.dart';

String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'Just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} min ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} h ago';
  } else if (difference.inDays < 2) {
    return '${difference.inDays} day ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 30) {
    return '${(difference.inDays / 7).floor()} w ago';
  } else if (difference.inDays < 365) {
    return '${(difference.inDays / 30).floor()} mo ago';
  } else {
    return '${(difference.inDays / 365).floor()} y ago';
  }
}

String formatChatTime(DateTime dateTime) {
  final now = DateTime.now();

  final today = DateTime(now.year, now.month, now.day);
  final messageDay = DateTime(dateTime.year, dateTime.month, dateTime.day);
  final difference = today.difference(messageDay).inDays;

  if (difference == 0) {
    // Today → 3:08 AM
    return DateFormat('h:mm a').format(dateTime);
  } else if (difference == 1) {
    // Yesterday
    return 'Yesterday';
  } else if (difference < 7) {
    // Weekday → Mon, Tue
    return DateFormat('EEE').format(dateTime);
  } else {
    // Old → 12/01/2025
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}
