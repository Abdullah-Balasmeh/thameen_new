import 'package:flutter/material.dart';

enum NotificationType {
  message,
  match,
  itemFound,
  itemLost,
  system,
}

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final DateTime timestamp;
  final bool isRead;
  final String? imageUrl;
  final Map<String, dynamic>? data;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.timestamp,
    this.isRead = false,
    this.imageUrl,
    this.data,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    NotificationType? type,
    DateTime? timestamp,
    bool? isRead,
    String? imageUrl,
    Map<String, dynamic>? data,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      imageUrl: imageUrl ?? this.imageUrl,
      data: data ?? this.data,
    );
  }

  String get timeAgo {
    final difference = DateTime.now().difference(timestamp);

    if (difference.inDays > 7) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  IconData get icon {
    switch (type) {
      case NotificationType.message:
        return Icons.message;
      case NotificationType.match:
        return Icons.auto_awesome;
      case NotificationType.itemFound:
        return Icons.check_circle;
      case NotificationType.itemLost:
        return Icons.warning;
      case NotificationType.system:
        return Icons.info;
    }
  }

  Color get iconColor {
    switch (type) {
      case NotificationType.message:
        return const Color(0xFF2196F3);
      case NotificationType.match:
        return const Color(0xFF9C27B0);
      case NotificationType.itemFound:
        return const Color(0xFF4CAF50);
      case NotificationType.itemLost:
        return const Color(0xFFFF9800);
      case NotificationType.system:
        return const Color(0xFF607D8B);
    }
  }
}