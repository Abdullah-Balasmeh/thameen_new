import 'package:cloud_firestore/cloud_firestore.dart';

class UserPresenceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> setOnline(String userId) async {
    await _firestore.collection('users').doc(userId).update({
      'isOnline': true,
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }

  Future<void> setOffline(String userId) async {
    await _firestore.collection('users').doc(userId).update({
      'isOnline': false,
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }
}
