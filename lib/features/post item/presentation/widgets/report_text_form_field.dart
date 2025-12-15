import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';

class ReportTextFormField extends StatefulWidget {
  const ReportTextFormField({
    super.key,
    required this.keyboardType,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
    this.textInputAction,
    this.suffixIcon,
    required this.maxLines,
  });
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final int maxLines;

  @override
  State<ReportTextFormField> createState() => _ReportTextFormFieldState();
}

class _ReportTextFormFieldState extends State<ReportTextFormField> {
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
    final bool isFocused = _focusNode.hasFocus;
    final theme = Theme.of(context);
    return TextFormField(
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      cursorColor: AppColors.primary,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: _focusNode,
      style: AppTextStyle.semiBold18,
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: AppTextStyle.medium14.copyWith(
          color: AppColors.error,
        ),
        iconColor: isFocused
            ? AppColors.primary
            : theme.textTheme.bodyLarge!.color,
        suffixIconColor: isFocused
            ? AppColors.primary
            : theme.textTheme.bodyLarge!.color,
        prefixIconColor: isFocused
            ? AppColors.primary
            : theme.textTheme.bodyLarge!.color,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.semiBold18.copyWith(
          color: theme.textTheme.bodyLarge!.color,
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildFocusedBorder(),
        errorBorder: buildErrorBorder(context),
      ),
    );
  }
}
