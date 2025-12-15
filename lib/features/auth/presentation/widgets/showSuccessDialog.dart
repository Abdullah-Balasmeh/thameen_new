import 'package:flutter/material.dart';
import 'package:thameen/features/auth/presentation/widgets/success_dialog_content.dart';

void showSuccessDialog(BuildContext context, String message) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true, // يغلق عند الضغط خارج الحوار
    barrierLabel: '',
    barrierColor: Colors.black54, // الخلفية المعتمة
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox.shrink(); // مهم
    },
    transitionBuilder: (context, animation, _, child) {
      return Transform.scale(
        scale: animation.value,
        child: Opacity(
          opacity: animation.value,
          child: SuccessDialogContent(
            message: message,
          ),
        ),
      );
    },
  );
}
