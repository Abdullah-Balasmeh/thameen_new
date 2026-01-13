import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/language/language_provider.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';

class EditProfileTextFormField extends StatefulWidget {
  const EditProfileTextFormField({
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
  State<EditProfileTextFormField> createState() =>
      _EditProfileTextFormFieldState();
}

class _EditProfileTextFormFieldState extends State<EditProfileTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool readOnly = true;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      if (!_focusNode.hasFocus) {
        setState(() {
          readOnly = true;
        });
      }
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
    final isArabic = Provider.of<LanguageProvider>(context).isArabic;
    return Stack(
      alignment: isArabic ? Alignment.centerLeft : Alignment.centerRight,
      children: [
        IgnorePointer(
          ignoring: readOnly,
          child: TextFormField(
            cursorColor: AppColors.primary,
            style: AppTextStyle.semiBold18,
            textInputAction: widget.textInputAction,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            focusNode: _focusNode,
            readOnly: readOnly,
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
          ),
        ),
        if (readOnly)
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.primary),
            onPressed: () {
              setState(() {
                readOnly = false;
              });
              FocusScope.of(context).requestFocus(_focusNode);
            },
          ),
      ],
    );
  }
}
