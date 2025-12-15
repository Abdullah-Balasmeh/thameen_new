import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';

AppBar authAppBar({
  required BuildContext context,
  required String title,
  required bool showButtonBack,
  required VoidCallback? onPressed,
  required List<Widget> actions,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyle.bold24,
    ),
    leading: showButtonBack
        ? IconButton(
            style: TextButton.styleFrom(
              elevation: 10,
              shape: CircleBorder(
                side: BorderSide(
                  color: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.color!.withValues(alpha: 0.6),
                  width: 1,
                ),
              ),
            ),
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_back_ios_new),
          )
        : null,

    actions: actions,
  );
}
