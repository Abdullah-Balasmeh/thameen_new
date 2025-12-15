import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';

class AppTextFromField extends StatefulWidget {
  const AppTextFromField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    this.validator,
    required this.controller,
    this.autovalidateMode,
    this.onChanged,
    this.textInputAction,
  });
  final String hintText;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;

  @override
  State<AppTextFromField> createState() => _AppTextFromFieldState();
}

class _AppTextFromFieldState extends State<AppTextFromField> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // rebuild when focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;
    return TextFormField(
      cursorColor: AppColors.primary,
      style: AppTextStyle.semiBold18,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        prefixIconColor: isFocused
            ? AppColors.primary
            : Theme.of(context).colorScheme.onSurface,
        errorMaxLines: 2,
        errorStyle: AppTextStyle.medium14.copyWith(
          color: Theme.of(context).colorScheme.error,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildFocusedBorder(),
        errorBorder: buildErrorBorder(context),
      ),
    );
  }
}
