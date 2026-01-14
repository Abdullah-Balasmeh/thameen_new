class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String? photoUrl;
  final bool isEmailVerified;
  final String createdAt;
  final List<String?>? postsId;
  final bool isOnline;
  final DateTime lastSeen;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.photoUrl,
    required this.isEmailVerified,
    required this.createdAt,
    this.postsId,
    required this.isOnline,
    required this.lastSeen,
  });
  UserEntity copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phoneNumber,
    String? photoUrl,
    bool? isEmailVerified,
    String? createdAt,
    List<String?>? postsId,
    bool? isOnline,
    DateTime? lastSeen,
  }) {
    return UserEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      createdAt: createdAt ?? this.createdAt,
      postsId: postsId ?? this.postsId,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'photoUrl': photoUrl,
      'isEmailVerified': isEmailVerified,
      'createdAt': createdAt,
      'postsId': postsId,
      'isOnline': isOnline,
      'lastSeen': lastSeen,
    };
  }
}
