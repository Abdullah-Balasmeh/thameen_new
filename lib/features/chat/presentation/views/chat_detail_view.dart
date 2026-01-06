import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/chat/domain/repositories/chat_repository.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:thameen/features/chat/presentation/widgets/chat_detail_app_bar.dart';
import 'package:thameen/features/chat/presentation/widgets/chat_detail_view_body.dart';
import 'package:thameen/features/chat/presentation/widgets/chat_input_field.dart';

class ChatDetailView extends StatelessWidget {
  const ChatDetailView({
    super.key,
    required this.chatId,
  });
  static const String routeName = 'chat_detail_view';
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (_) => getIt<ChatCubit>()..loadMessages(chatId),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: buildChatDetailAppBar(
            context,
            chatId,
            getIt<ChatRepository>(),
          ),
          body: ChatDetailViewBody(chatId: chatId),
          bottomNavigationBar: ChatInputField(
            chatId: chatId,
          ),
        ),
      ),
    );
  }
}
