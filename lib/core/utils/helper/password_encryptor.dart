import 'package:encrypt/encrypt.dart' as encrypt;

class PasswordEncryptor {
  static final key = encrypt.Key.fromUtf8('16charsSecretKey');
  static final iv = encrypt.IV.fromUtf8('16charsInitVect');

  static String encryptPassword(String password) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);
    return encrypted.base64; // تخزين هذا فقط في Firestore
  }

  static String decryptPassword(String encryptedPassword) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(encryptedPassword, iv: iv);
    return decrypted; // يرجع الباسورد الأصلي
  }
}
