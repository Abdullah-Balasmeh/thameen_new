import 'package:firebase_auth/firebase_auth.dart';
import 'package:thameen/core/utils/helper/password_encryptor.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/features/profile/domain/repo/change_password_repo.dart';
import 'package:thameen/shared/services/database_service.dart';
import 'package:thameen/shared/services/firebase_auth_service.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final AuthRepo authRepo;
  final FirebaseAuthService authService;
  final DatabaseService databaseService;
  static const String usersPath = 'users';
  ChangePasswordRepoImpl({
    required this.authRepo,
    required this.databaseService,
    required this.authService,
  });
  @override
  Future<void> changePassword(
    String userId,
    String newPassword,
  ) async {
    final email = SharedPreferencesSingleton.getString('email');
    final oldPassword = SharedPreferencesSingleton.getString('password');
    await authRepo.signInWithEmailAndPassword(email, oldPassword);
    User? user = authService.currentUser;
    if (user != null) {
      await user.updatePassword(newPassword);
      SharedPreferencesSingleton.setString('password', newPassword);
    } else {
      throw Exception('User not logged in');
    }

    final hashed = PasswordEncryptor.encryptPassword(newPassword);

    await databaseService.updateData(
      path: usersPath,
      documentId: user.uid,
      data: {'password': hashed},
    );
  }
}
