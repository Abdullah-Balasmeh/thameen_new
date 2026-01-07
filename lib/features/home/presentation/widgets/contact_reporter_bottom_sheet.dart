import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:thameen/features/chat/presentation/views/chat_detail_view.dart';
import 'package:thameen/features/home/domain/entities/poster_entity.dart';
import 'package:thameen/features/home/presentation/widgets/contact_option.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';
import 'package:thameen/shared/widgets/bottom_sheet_close_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactReporterBottomSheet extends StatelessWidget {
  const ContactReporterBottomSheet({
    super.key,
    required this.poster,
    required this.postId,
    required this.parentContext,
    required this.post,
  });
  final PosterEntity poster;
  final String postId;
  final BuildContext parentContext;
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    log('post.contactMethods: ${post.contactMethods.length}');
    log('post.contactMethods: ${post.contactMethods}');
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
          if (post.contactMethods.contains(ContactMethod.inAppChat)) ...[
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
                final userid = SharedPreferencesSingleton.getString('user');
                if (userid == poster.id) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('You can not chat with yourself'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  return;
                } else if (parentContext.mounted) {
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
          ],

          if (post.contactMethods.contains(ContactMethod.email)) ...[
            const Divider(height: 1),
            ContactOption(
              icon: Icons.email_outlined,
              title: 'Send Email',
              subtitle: poster.email,
              iconColor: AppColors.primary,
              onTap: () async {
                final email = poster.email;
                if (email.isEmpty) return;

                final uri = Uri(
                  scheme: 'mailto',
                  path: email,
                );

                await launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
          ],

          if (post.contactMethods.contains(ContactMethod.mobilePhone)) ...[
            const Divider(height: 1),
            ContactOption(
              icon: Icons.phone_outlined,
              title: 'Call Phone',
              subtitle: poster.phoneNumber,
              iconColor: AppColors.primary,
              onTap: () async {
                final phone = poster.phoneNumber;

                if (phone.isEmpty) return;

                final uri = Uri.parse('tel:$phone');

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
            ),
          ],

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
