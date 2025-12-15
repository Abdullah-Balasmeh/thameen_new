import 'dart:io';

class PostEntity {
  final String id;
  final String itemName;
  final String itemCategory;
  final String itemDescription;
  final String location;
  final bool type;
  final double bountyAmount;
  final bool postAnonymously;
  final List<String> contactMethods;
  final List<File> photos;

  PostEntity({
    required this.id,
    required this.itemName,
    required this.itemCategory,
    required this.itemDescription,
    required this.location,
    required this.type,
    required this.bountyAmount,
    required this.postAnonymously,
    required this.contactMethods,
    required this.photos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'itemCategory': itemCategory,
      'itemDescription': itemDescription, // Add other fields as needed
      'location': location,
      'type': type,
      'bountyAmount': bountyAmount,
      'postAnonymously': postAnonymously,
      'contactMethods': contactMethods,
      'photos': photos,
    };
  }
}
