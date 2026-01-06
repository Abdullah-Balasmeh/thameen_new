import 'package:flutter/material.dart';
import 'package:thameen/features/chat/data/models/message_model.dart';

Icon buildMessageStatusIcon(MessageStatus status) {
  switch (status) {
    case MessageStatus.sent:
      return const Icon(Icons.done, color: Colors.white70, size: 16);

    case MessageStatus.delivered:
      return const Icon(Icons.done_all, color: Colors.white70, size: 16);

    case MessageStatus.seen:
      return const Icon(Icons.done_all, color: Colors.white, size: 16);
  }
}
