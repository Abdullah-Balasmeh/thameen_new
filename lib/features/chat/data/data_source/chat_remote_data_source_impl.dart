import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thameen/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:thameen/features/chat/data/models/chat_model.dart';
import 'package:thameen/features/chat/data/models/message_model.dart';
import 'package:thameen/shared/services/database_service.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final DatabaseService firestore;

  ChatRemoteDataSourceImpl({required this.firestore});

  @override
  Future<String> createOrGetChat({
    required String currentUserId,
    required String otherUserId,
    required String postId,
  }) async {
    if (currentUserId == otherUserId) {
      throw Exception('You cannot chat with yourself');
    }

    final users = [currentUserId, otherUserId]..sort();
    final chatId = '${users[0]}_${users[1]}';
    final chatRef = FirebaseFirestore.instance.collection('chats').doc(chatId);

    await FirebaseFirestore.instance.runTransaction((tx) async {
      final snapshot = await tx.get(chatRef);

      if (!snapshot.exists) {
        tx.set(chatRef, {
          'userIds': users,
          'postId': postId,
          'lastMessage': '',
          'lastMessageTime': Timestamp.now(),
          'unreadCount': {
            currentUserId: 0,
            otherUserId: 0,
          },
          'createdAt': Timestamp.now(),
        });
      }
    });

    return chatId;
  }

  @override
  Future<void> sendMessage(MessageModel message) async {
    // 1️⃣ أضف الرسالة
    await firestore.addData(
      path: 'chats/${message.chatId}/messages',
      data: {
        'senderId': message.senderId,
        'text': message.text,
        'createdAt': Timestamp.now(),
        'status': 'sent',
      },
    );

    // 2️⃣ جيب الشات
    final chatDoc = await FirebaseFirestore.instance
        .collection('chats')
        .doc(message.chatId)
        .get();

    final userIds = List<String>.from(chatDoc['userIds'] as List<dynamic>);

    // 3️⃣ حدّد المستلم
    final receiverId = userIds.firstWhere((id) => id != message.senderId);
    log('receiverId after send message: $receiverId');

    // 4️⃣ حدّث lastMessage + unreadCount
    await firestore.updateData(
      path: 'chats',
      documentId: message.chatId,
      data: {
        'lastMessage': message.text,
        'lastMessageTime': Timestamp.now(),
        'unreadCount.$receiverId': FieldValue.increment(1),
      },
    );
  }

  @override
  Stream<List<MessageModel>> getMessages(String chatId) {
    return FirebaseFirestore.instance
        .collection('chats/$chatId/messages')
        .orderBy('createdAt')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return MessageModel(
              id: doc.id,
              chatId: chatId,
              senderId: doc['senderId'] as String,
              text: doc['text'] as String,
              createdAt: (doc['createdAt'] as Timestamp).toDate(),
              status: _mapStatus(doc['status'] as String),
            );
          }).toList(),
        );
  }

  MessageStatus _mapStatus(String status) {
    switch (status) {
      case 'sent':
        return MessageStatus.sent;
      case 'delivered':
        return MessageStatus.delivered;
      case 'seen':
        return MessageStatus.seen;
      default:
        return MessageStatus.sent;
    }
  }

  @override
  Stream<List<ChatModel>> getUserChats(String userId) {
    return FirebaseFirestore.instance
        .collection('chats')
        .where('userIds', arrayContains: userId)
        .orderBy('lastMessageTime', descending: true)
        .snapshots()
        .map(
          (s) => s.docs
              .map(
                (e) => ChatModel(
                  id: e.id,
                  userIds: List<String>.from(e['userIds'] as List<dynamic>),
                  postId: e['postId'] as String,
                  lastMessage: e['lastMessage'] as String,
                  lastMessageTime: (e['lastMessageTime'] as Timestamp).toDate(),
                  unreadCount: Map<String, int>.from(
                    e['unreadCount'] as Map<String, dynamic>,
                  ),
                  createdAt: (e['createdAt'] as Timestamp).toDate(),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<Map<String, dynamic>> getUserData(String userId) async {
    return firestore.getData(
      path: 'users',
      documentId: userId,
    );
  }

  @override
  Future<void> markMessageDelivered({
    required String chatId,
    required String messageId,
  }) async {
    await FirebaseFirestore.instance
        .collection('chats/$chatId/messages')
        .doc(messageId)
        .update({'status': 'delivered'});
  }

  @override
  Future<void> markMessageSeen({
    required String chatId,
    required String messageId,
  }) async {
    await FirebaseFirestore.instance
        .collection('chats/$chatId/messages')
        .doc(messageId)
        .update({'status': 'seen'});
  }

  @override
  Future<void> resetUnreadCount({
    required String chatId,
    required String userId,
  }) async {
    await firestore.updateData(
      path: 'chats',
      documentId: chatId,
      data: {
        'unreadCount.$userId': 0,
      },
    );
  }

  @override
  Stream<Map<String, dynamic>> streamUser(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((doc) => doc.data()!);
  }
}
