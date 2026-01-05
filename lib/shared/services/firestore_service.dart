import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thameen/core/errors/database_exceptions.dart';

import 'database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firestore;

  FirestoreService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _col(String path) =>
      _firestore.collection(path);

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId == null) {
        await _col(path).add(data);
      } else {
        await _col(path).doc(documentId).set(data);
      }
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    try {
      final doc = await _col(path).doc(documentId).get();
      if (!doc.exists) throw const DocumentNotFoundException();
      return doc.data()!;
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    }
  }

  @override
  Future<bool> exists({
    required String path,
    required String documentId,
  }) async {
    final doc = await _col(path).doc(documentId).get();
    return doc.exists;
  }

  @override
  Future<void> updateData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _col(path).doc(documentId).update(data);
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    }
  }

  @override
  Future<void> deleteData({
    required String path,
    required String documentId,
  }) async {
    try {
      await _col(path).doc(documentId).delete();
    } on FirebaseException catch (e) {
      log('Error: ${e.toString()}');
      _handleFirebaseException(e);
    }
  }

  @override
  Future<void> deleteCollection({
    required String path,
  }) async {
    try {
      final snapshot = await _col(path).get();
      final batch = _firestore.batch();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    }
  }

  @override
  Stream<Map<String, dynamic>> streamDocument({
    required String path,
    required String documentId,
  }) {
    return _col(path).doc(documentId).snapshots().map((doc) {
      if (!doc.exists) throw const DocumentNotFoundException();
      return doc.data()!;
    });
  }

  @override
  Stream<List<Map<String, dynamic>>> streamCollection({
    required String path,
  }) {
    return _col(path).snapshots().map(
      (snapshot) => snapshot.docs.map((e) => e.data()).toList(),
    );
  }

  Never _handleFirebaseException(FirebaseException e) {
    if (e.code == 'permission-denied') {
      throw const PermissionDeniedException();
    }
    log('Unknown Firebase Exception: ${e.toString()}');
    throw const UnknownDatabaseException();
  }

  @override
  Future<void> setData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _col(path).doc(documentId).set(data);
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection({
    required String path,
    int? limit,
  }) async {
    try {
      Query query = _col(path).orderBy('createdAt', descending: true);
      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();
      return snapshot.docs
          .map((e) => e.data() as Map<String, dynamic>)
          .toList();
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> queryCollection({
    required String path,
    required String field,
    required dynamic isEqualTo,
  }) async {
    try {
      final snapshot = await _col(
        path,
      ).where(field, isEqualTo: isEqualTo).get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      return snapshot.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      _handleFirebaseException(e);
    } catch (e) {
      return [];
    }
  }
}
