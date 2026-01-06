class ChatUserModel {
  final String id;
  final String name;
  final String? avatarUrl;
  final bool isOnline;
  final DateTime lastSeen;

  ChatUserModel({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.isOnline,
    required this.lastSeen,
  });
}
