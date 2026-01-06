import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/chat/data/models/chat_preview_model.dart';

class LastMessageAndMessagesCount extends StatelessWidget {
  const LastMessageAndMessagesCount({
    super.key,
    required this.chat,
  });
  final ChatPreviewModel chat;
  @override
  Widget build(BuildContext context) {
    log('unreadCount: ${chat.unreadCount}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          chat.lastMessage,
          style: AppTextStyle.medium14,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (chat.unreadCount > 0)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: AppColors.success,
            ),
            child: Text(
              chat.unreadCount.toString(),
              style: AppTextStyle.medium14.copyWith(
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
