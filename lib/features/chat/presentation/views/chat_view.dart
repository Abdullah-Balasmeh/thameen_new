import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:thameen/features/chat/presentation/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatCubit>()..loadChats(),
      child: const ChatViewBody(),
    );
  }
}
