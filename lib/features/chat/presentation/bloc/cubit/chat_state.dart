part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

// -------- Chat List --------
class ChatListLoaded extends ChatState {
  final List<ChatPreviewModel> chats;
  ChatListLoaded(this.chats);
}

// -------- Messages --------
class ChatMessagesLoaded extends ChatState {
  final List<MessageModel> messages;
  ChatMessagesLoaded(this.messages);
}

// -------- Sending --------
class MessageSending extends ChatState {}

class MessageSent extends ChatState {}

// -------- Error --------
class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}
