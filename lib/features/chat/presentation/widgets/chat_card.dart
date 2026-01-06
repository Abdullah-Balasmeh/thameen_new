import 'package:flutter/material.dart';
import 'package:thameen/features/chat/data/models/chat_preview_model.dart';
import 'package:thameen/features/chat/presentation/widgets/last_message_and_messages_count.dart';
import 'package:thameen/features/chat/presentation/widgets/user_avatar.dart';
import 'package:thameen/features/chat/presentation/widgets/user_name_and_last_message_time.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chat,
  });
  final ChatPreviewModel chat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          UserAvatar(
            chat: chat,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserNameAndLastMessageTime(chat: chat),
                LastMessageAndMessagesCount(chat: chat),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
