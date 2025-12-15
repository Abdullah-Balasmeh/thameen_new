import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';

AppBar buildAppBar(
  BuildContext context, {
  required bool showButtonBack,
  required bool showButtonActions,
  required String title,
  VoidCallback? onPressed,
  Color? backgroundColor,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: backgroundColor ?? Colors.transparent,
    scrolledUnderElevation: 0.0,
    leading: showButtonBack
        ? IconButton(
            style: TextButton.styleFrom(
              elevation: 10,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Color(0xffF1F1F5),
                  width: 1,
                ),
              ),
            ),
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          )
        : null,
    title: Text(
      title,
      style: AppTextStyle.bold24.copyWith(
        color: backgroundColor != null ? Colors.white : null,
      ),
    ),
    centerTitle: true,
    actions: showButtonActions
        ? [
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: backgroundColor != null ? Colors.white : null,
              ),
              onPressed: () {
                // Handle notifications
              },
            ),
          ]
        : null,
  );
}
