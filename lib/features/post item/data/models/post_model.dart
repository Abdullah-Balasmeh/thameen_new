import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.id,
    required super.userId,
    required super.postType,
    required super.itemName,
    required super.itemCategory,
    required super.itemDescription,
    required super.location,
    required super.bountyAmount,
    required super.postAnonymously,
    required super.contactMethods,
    required super.photoUrls,
    required super.createdAt,
    required super.postState,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      postType: getPostType(map['postType'] as String),
      itemName: map['itemName'] as String,
      itemCategory: map['itemCategory'] as String,
      itemDescription: map['itemDescription'] as String,
      location: map['location'] as String,
      bountyAmount: (map['bountyAmount'] as num).toDouble(),
      postAnonymously: map['postAnonymously'] as bool,
      contactMethods: (map['contactMethods'] as List<dynamic>)
          .map((e) => ContactMethod.values.byName(e as String))
          .toSet() // 🔥 مهم
          .toList(),

      photoUrls: List<String>.from(map['photoUrls'] as List<dynamic>),

      createdAt: (map['createdAt'] as Timestamp).toDate(),
      postState: getPostState(map['postState'] as String),
    );
  }
}
