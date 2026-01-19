import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/language/language_provider.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/extuntions/time_formatter.dart';
import 'package:thameen/features/chat/data/models/message_model.dart';
import 'package:thameen/features/chat/presentation/views/chat_image_viewer.dart';

class MessageBubbleReceiver extends StatelessWidget {
  const MessageBubbleReceiver({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.watch<LanguageProvider>().isArabic;

    return Align(
      alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
              if (message.type == MessageType.text)
                Text(
                  message.text ?? '',
                  style: AppTextStyle.medium16.copyWith(color: Colors.white),
                )
              else
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: List.generate(
                    message.imageUrls!.length,
                    (index) {
                      final url = message.imageUrls![index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (_) => ChatImageViewer(
                                images: message.imageUrls!,
                                initialIndex: index,
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            url,
                            width: 96,
                            height: 96,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    formatTime(message.createdAt),
                    style: AppTextStyle.medium12.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
