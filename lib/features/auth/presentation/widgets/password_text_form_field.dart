import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
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
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool showPassword = false;
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
      obscureText: !showPassword,
      obscuringCharacter: '●', // '⬤'
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        hintText: widget.hintText,
        prefixIconColor: isFocused
            ? AppColors.primary
            : Theme.of(context).colorScheme.onSurface,
        suffixIconColor: isFocused
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
