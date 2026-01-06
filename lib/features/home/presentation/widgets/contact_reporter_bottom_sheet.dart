import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:thameen/features/chat/presentation/views/chat_detail_view.dart';
import 'package:thameen/features/home/domain/entities/poster_entity.dart';
import 'package:thameen/features/home/presentation/widgets/contact_option.dart';
import 'package:thameen/shared/widgets/bottom_sheet_close_container.dart';

class ContactReporterBottomSheet extends StatelessWidget {
  const ContactReporterBottomSheet({
    super.key,
    required this.poster,
    required this.postId,
    required this.parentContext,
  });
  final PosterEntity poster;
  final String postId;
  final BuildContext parentContext;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetCloseContainer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Contact Options',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTextStyle.medium14.color,
              ),
            ),
          ),
          const Divider(height: 1),
          ContactOption(
            icon: Icons.chat_bubble_outline,
            title: 'Start Chat',
            iconColor: AppColors.primary,
            onTap: () async {
              Navigator.pop(context);

              final chatCubit = context.read<ChatCubit>();

              final chatId = await chatCubit.startChat(
                otherUserId: poster.id, // صاحب البوست
                postId: postId,
              );

              if (parentContext.mounted) {
                Navigator.push(
                  parentContext,
                  MaterialPageRoute(
                    builder: (_) => ChatDetailView(
                      chatId: chatId,
                    ),
                  ),
                );
              }
            },
          ),
          const Divider(height: 1),
          ContactOption(
            icon: Icons.email_outlined,
            title: 'Send Email',
            subtitle: poster.email,
            iconColor: AppColors.primary,
            onTap: () {},
          ),
          const Divider(height: 1),
          ContactOption(
            icon: Icons.phone_outlined,
            title: 'Call Phone',
            subtitle: poster.phoneNumber,
            iconColor: AppColors.primary,
            onTap: () {},
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
