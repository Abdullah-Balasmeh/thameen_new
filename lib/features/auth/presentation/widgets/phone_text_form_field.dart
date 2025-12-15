import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';

class PhoneTextFormField extends StatefulWidget {
  const PhoneTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
    this.textInputAction,
    this.prefixIcon,
    this.prefix = '+962 7 ',
    required this.inputFormatters,
  });

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;

  /// The fixed, unremovable prefix (default '+962 7 ')
  final String prefix;

  /// Additional formatters (your JordanPhoneFormatter should be included here)
  final List<TextInputFormatter> inputFormatters;
  @override
  State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
}

class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Make sure the field always starts with the prefix.
    if (!widget.controller.text.startsWith(widget.prefix)) {
      widget.controller.text = widget.prefix;
      widget.controller.selection = TextSelection.collapsed(
        offset: widget.controller.text.length,
      );
    }

    _focusNode.addListener(() {
      // If the caret ever slips into the prefix (e.g., via click),
      // push it to just after the prefix.
      if (_focusNode.hasFocus) {
        final sel = widget.controller.selection.start;
        if (sel < widget.prefix.length) {
          widget.controller.selection = TextSelection.collapsed(
            offset: widget.controller.text.length,
          );
        }
      }
      setState(() {});
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
    return TextFormField(
      textDirection: TextDirection.ltr,
      cursorColor: AppColors.primary,
      style: AppTextStyle.semiBold18,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: _focusNode,
      onTap: () {
        // Prevent placing the caret inside the prefix
        final sel = widget.controller.selection.start;
        if (sel < widget.prefix.length) {
          widget.controller.selection = TextSelection.collapsed(
            offset: widget.controller.text.length,
          );
        }
      },
      inputFormatters: widget.inputFormatters,
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
