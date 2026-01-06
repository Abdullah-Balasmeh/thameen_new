import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/extuntions/date_time_ex.dart';
import 'package:thameen/features/chat/data/models/chat_preview_model.dart';

class UserNameAndLastMessageTime extends StatelessWidget {
  const UserNameAndLastMessageTime({
    super.key,
    required this.chat,
  });
  final ChatPreviewModel chat;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          chat.otherUser.name,
          style: AppTextStyle.bold20,
        ),
        Text(
          formatChatTime(chat.lastMessageTime),
          style: AppTextStyle.medium14.copyWith(
            color: AppColors.success,
          ),
        ),
      ],
    );
  }
}
