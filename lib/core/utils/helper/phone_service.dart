import 'package:flutter/services.dart';

class JordanPhoneFormatter extends TextInputFormatter {
  JordanPhoneFormatter({this.prefix = '+962 7 '});

  final String prefix;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Ensure we always start with the prefix
    String text = newValue.text;
    if (!text.startsWith(prefix)) {
      // If the user tries to delete the prefix or paste over it,
      // restore the old text (which we guarantee is valid)
      return oldValue;
    }

    // Extract what's after the prefix and keep only digits
    String digits = text
        .substring(prefix.length)
        .replaceAll(RegExp(r'[^0-9]'), '');

    // Cap at 8 digits
    if (digits.length > 8) {
      digits = digits.substring(0, 8);
    }

    final String finalText = prefix + digits;

    // Keep the caret at the end (or just after the prefix if the user tries to go before it)
    final int selectionOffset = finalText.length.clamp(
      prefix.length,
      finalText.length,
    );

    return TextEditingValue(
      text: finalText,
      selection: TextSelection.collapsed(offset: selectionOffset),
      composing: TextRange.empty,
    );
  }
}
