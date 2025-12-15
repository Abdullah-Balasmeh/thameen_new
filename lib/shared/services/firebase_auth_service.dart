import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:thameen/core/errors/exceptions.dart';
import 'package:thameen/core/errors/map_firebase_error_to_message.dart';
import 'package:thameen/generated/l10n.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException => code: ${e.code}, message: ${e.message}');

      throw CustomException(message: mapFirebaseErrorToMessage(e.code));
    } catch (e) {
      log('Unexpected Exception => $e');
      throw CustomException(message: S.current.errorUnknown);
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException => code: ${e.code}, message: ${e.message}');

      throw CustomException(message: mapFirebaseErrorToMessage(e.code));
    } catch (e) {
      log('Unexpected Exception => $e');
      throw CustomException(message: S.current.errorUnknown);
    }
  }

  Future<void> deleteAccount() async {
    await _auth.currentUser?.delete();
  }
}
