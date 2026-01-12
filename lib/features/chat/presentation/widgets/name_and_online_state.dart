import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/extuntions/format_last_seen.dart';
import 'package:thameen/features/chat/data/models/chat_user_model.dart';

class NameAndOnlineState extends StatelessWidget {
  const NameAndOnlineState({
    super.key,
    required this.user,
    required this.displayName,
  });
  final ChatUserModel user;
  final String displayName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayName,
          style: AppTextStyle.bold20.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),

        Text(
          user.isOnline ? 'Online' : formatLastSeen(user.lastSeen),
          style: AppTextStyle.medium14.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
