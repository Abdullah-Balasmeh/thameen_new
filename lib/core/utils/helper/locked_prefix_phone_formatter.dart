import 'package:flutter/services.dart';

class LockedPrefixPhoneFormatter extends TextInputFormatter {
  final String prefix;
  final int totalLength;

  LockedPrefixPhoneFormatter({
    required this.prefix,
    required this.totalLength,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // لازم يبدأ بالبريفكس
    if (!newValue.text.startsWith(prefix)) {
      return oldValue;
    }

    // منع الكيرسر داخل البريفكس
    if (newValue.selection.start < prefix.length) {
      return oldValue;
    }

    // منع حروف غير أرقام بعد البريفكس
    final afterPrefix = newValue.text.substring(prefix.length);
    if (!RegExp(r'^[0-9]*$').hasMatch(afterPrefix)) {
      return oldValue;
    }

    //  منع الزيادة عن الطول المطلوب
    if (newValue.text.length > totalLength) {
      return oldValue;
    }

    return newValue;
  }
}
