import 'package:intl/intl.dart';

String formatLastSeen(DateTime lastSeen) {
  final now = DateTime.now();
  final difference = now.difference(lastSeen);

  if (difference.inMinutes < 1) {
    return 'Last seen just now';
  }

  if (difference.inMinutes < 60) {
    return 'Last seen ${difference.inMinutes} min ago';
  }

  final isToday =
      now.year == lastSeen.year &&
      now.month == lastSeen.month &&
      now.day == lastSeen.day;

  if (isToday) {
    return 'Last seen today at ${DateFormat('h:mm a').format(lastSeen)}';
  }

  final yesterday = now.subtract(const Duration(days: 1));
  final isYesterday =
      yesterday.year == lastSeen.year &&
      yesterday.month == lastSeen.month &&
      yesterday.day == lastSeen.day;

  if (isYesterday) {
    return 'Last seen yesterday at ${DateFormat('h:mm a').format(lastSeen)}';
  }

  return 'Last seen ${DateFormat('d MMM at h:mm a').format(lastSeen)}';
}
