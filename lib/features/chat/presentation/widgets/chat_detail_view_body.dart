import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/chat/data/models/date_header.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:thameen/features/chat/presentation/widgets/date_header.dart';
import 'package:thameen/features/chat/presentation/widgets/message_bubble_receiver.dart';
import 'package:thameen/features/chat/presentation/widgets/message_bubble_sender.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

class ChatDetailViewBody extends StatefulWidget {
  const ChatDetailViewBody({super.key, required this.chatId});
  final String chatId;
  @override
  State<ChatDetailViewBody> createState() => _ChatDetailViewBodyState();
}

class _ChatDetailViewBodyState extends State<ChatDetailViewBody> {
  final ScrollController _scrollController = ScrollController();
  bool _initialScrolled = false;
  void _scrollToBottom({bool animated = true}) {
    if (!_scrollController.hasClients) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final position = _scrollController.position.maxScrollExtent + 150;

      if (animated) {
        _scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      } else {
        _scrollController.jumpTo(position);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatMessagesLoaded) {
          if (!_initialScrolled) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom(animated: false);
              _initialScrolled = true;
            });
          } else {
            _scrollToBottom();
          }
        }
      },

      builder: (context, state) {
        if (state is ChatMessagesLoaded) {
          final items = groupMessagesByDay(state.messages);
          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              if (item is DateHeaderItem) {
                return DateHeader(date: item.date);
              }
              if (item is MessageItem) {
                final message = item.message;
                final isMe =
                    message.senderId ==
                    SharedPreferencesSingleton.getString('user');
                return isMe
                    ? MessageBubbleSender(message: message)
                    : MessageBubbleReceiver(message: message);
              }
              return const SizedBox();
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
