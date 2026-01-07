import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:thameen/features/chat/presentation/views/chat_detail_view.dart';
import 'package:thameen/features/chat/presentation/widgets/chat_card.dart';
import 'package:thameen/features/chat/presentation/widgets/chat_divider.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ChatListLoaded) {
          if (state.chats.isEmpty ||
              (state.chats.length == 1 && state.chats[0].lastMessage.isEmpty)) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.chat_bubble_outline,
                  size: 80,
                  color: AppColors.primary,
                ),
                Text(
                  'No chats yet...',
                  style: AppTextStyle.bold20,
                ),
              ],
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: state.chats.length,
            itemBuilder: (context, index) {
              final chat = state.chats[index];
              return chat.lastMessage.isEmpty
                  ? const SizedBox()
                  : GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatDetailView(
                              chatId: chat.chatId,
                            ),
                          ),
                        );
                      },
                      child: ChatCard(chat: chat),
                    );
            },
            separatorBuilder: (_, __) => const ChatDivider(),
          );
        }

        if (state is ChatError) {
          return Center(child: Text(state.message));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
