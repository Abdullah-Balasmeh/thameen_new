abstract class ChangePasswordRepo {
  Future<void> changePassword(String userId, String newPassword);
}
