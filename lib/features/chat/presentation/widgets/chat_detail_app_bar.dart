import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/chat/data/models/chat_user_model.dart';
import 'package:thameen/features/chat/domain/repositories/chat_repository.dart';
import 'package:thameen/features/chat/presentation/widgets/name_and_online_state.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

AppBar buildChatDetailAppBar(
  BuildContext context,
  String chatId,
  ChatRepository chatRepository,
) {
  final currentUserId = SharedPreferencesSingleton.getString('user');

  return AppBar(
    backgroundColor: AppColors.primary,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
    ),
    title: StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .snapshots(),
      builder: (context, chatSnapshot) {
        if (!chatSnapshot.hasData) {
          return const Text(
            'Loading...',
            style: TextStyle(color: Colors.white),
          );
        }

        final chatData = chatSnapshot.data?.data() as Map<String, dynamic>;

        final userIds = List<String>.from(chatData['userIds'] as List<dynamic>);

        final otherUserId = userIds.firstWhere((id) => id != currentUserId);

        return StreamBuilder<ChatUserModel>(
          stream: chatRepository.streamChatUser(otherUserId),
          builder: (context, userSnapshot) {
            if (!userSnapshot.hasData) {
              return const Text(
                'Loading...',
                style: TextStyle(color: Colors.white),
              );
            }

            return NameAndOnlineState(
              user: userSnapshot.data!,
            );
          },
        );
      },
    ),
  );
}
