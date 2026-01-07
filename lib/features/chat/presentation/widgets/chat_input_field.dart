import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key, required this.chatId});
  final String chatId;
  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _controller,
                  cursorColor: AppColors.primary,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  style: AppTextStyle.medium16,
                  minLines: 1,
                  maxLines: 5,
                  onChanged: (value) {
                    setState(() {
                      _canSend = value.trim().isNotEmpty;
                    });
                  },

                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attach_file,
                        size: 24,
                      ),
                    ),
                    border: buildBorder(),
                    enabledBorder: buildBorder(),
                    focusedBorder: buildFocusedBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _canSend
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: _canSend
                      ? () {
                          final text = _controller.text.trim();
                          if (text.isEmpty) return;
                          context.read<ChatCubit>().sendMessage(
                            chatId: widget.chatId,
                            text: text,
                          );
                          _controller.clear();
                          setState(() => _canSend = false);
                        }
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
