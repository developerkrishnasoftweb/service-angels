import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8('de9017e81fbbee6fa35a3bf975957b73');
final iv = IV.fromUtf8('055fc1f93b4dacb1');
final encryption = Encrypter(AES(key, mode: AESMode.cbc));

String encrypt(String text) {
  if(text != null) {
    if(text.isNotEmpty) {
      final encrypted = encryption.encrypt(text, iv: iv);
      return encrypted.base64;
    } else {
      return "";
    }
  } else {
    return "";
  }
}

String decrypt(String text) {
  if(text != null) {
    if(text.isNotEmpty) {
      final decrypted = encryption.decrypt(Encrypted.fromBase64(text), iv: iv);
      return decrypted;
    } else {
      return "";
    }
  } else {
    return "";
  }
}