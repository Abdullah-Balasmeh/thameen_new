class PostEntity {
  final String id;
  final String userId;
  final PostType postType;
  final String itemName;
  final String itemCategory;
  final String itemDescription;
  final String location;
  final double bountyAmount;
  final bool postAnonymously;
  final List<ContactMethod> contactMethods;
  final List<String> photoUrls;
  final DateTime createdAt;
  final PostState postState;

  PostEntity({
    required this.id,
    required this.userId,
    required this.postType,
    required this.itemName,
    required this.itemCategory,
    required this.itemDescription,
    required this.location,
    required this.bountyAmount,
    required this.postAnonymously,
    required this.contactMethods,
    required this.photoUrls,
    required this.createdAt,
    required this.postState,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'postType': postType.name, // enum → String
      'itemName': itemName,
      'itemCategory': itemCategory,
      'itemDescription': itemDescription,
      'location': location,
      'bountyAmount': bountyAmount,
      'postAnonymously': postAnonymously,
      'contactMethods': contactMethods.map((e) => e.name).toList(),
      'photoUrls': photoUrls,
      'createdAt': createdAt, // Firestore يقبل DateTime
      'postState': postState.name,
    };
  }

  PostEntity copyWith({
    String? id,
    String? userId,
    PostType? postType,
    String? itemName,
    String? itemCategory,
    String? itemDescription,
    String? location,
    double? bountyAmount,
    bool? postAnonymously,
    List<ContactMethod>? contactMethods,
    List<String>? photoUrls,
    DateTime? createdAt,
    PostState? postState,
  }) {
    return PostEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      postType: postType ?? this.postType,
      itemName: itemName ?? this.itemName,
      itemCategory: itemCategory ?? this.itemCategory,
      itemDescription: itemDescription ?? this.itemDescription,
      location: location ?? this.location,
      bountyAmount: bountyAmount ?? this.bountyAmount,
      postAnonymously: postAnonymously ?? this.postAnonymously,
      contactMethods: contactMethods ?? this.contactMethods,
      photoUrls: photoUrls ?? this.photoUrls,
      createdAt: createdAt ?? this.createdAt,
      postState: postState ?? this.postState,
    );
  }
}

enum PostType { lost, found, all }

enum ContactMethod { mobilePhone, inAppChat, email }

enum PostState { active, resolved, deleted }

PostType getPostType(String postType) {
  switch (postType) {
    case 'lost':
      return PostType.lost;
    case 'found':
      return PostType.found;
    case 'active':
      return PostType.all;
    default:
      return PostType.lost;
  }
}

List<ContactMethod> getContactMethods(List<String> contactMethods) {
  return contactMethods.map((method) {
    switch (method) {
      case 'Mobile Phone':
        return ContactMethod.mobilePhone;
      case 'In App Chat':
        return ContactMethod.inAppChat;
      case 'Email':
        return ContactMethod.email;
      default:
        return ContactMethod.inAppChat;
    }
  }).toList();
}

PostState getPostState(String postState) {
  switch (postState) {
    case 'active':
      return PostState.active;
    case 'resolved':
      return PostState.resolved;
    case 'deleted':
      return PostState.deleted;
    default:
      return PostState.active;
  }
}
