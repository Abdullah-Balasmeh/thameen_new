import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/language/language_provider.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/extuntions/time_formatter.dart';
import 'package:thameen/core/utils/helper/build_message_status_icon.dart';
import 'package:thameen/features/chat/data/models/message_model.dart';

class MessageBubbleReceiver extends StatelessWidget {
  const MessageBubbleReceiver({
    super.key,
    required this.message,
  });
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final isArabic = Provider.of<LanguageProvider>(context).isArabic;
    return Row(
      mainAxisAlignment: isArabic
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: AppColors.darkSurface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: AppTextStyle.medium16.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    formatTime(message.createdAt),
                    style: AppTextStyle.medium14.copyWith(
                      color: Colors.white70,
                    ),
                  ),

                  const Spacer(),
                  buildMessageStatusIcon(message.status),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
