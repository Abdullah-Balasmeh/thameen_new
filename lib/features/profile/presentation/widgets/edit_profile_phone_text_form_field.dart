import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/language/language_provider.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';
import 'package:thameen/core/utils/helper/locked_prefix_phone_formatter.dart';

class EditProfilePhoneTextFormField extends StatefulWidget {
  const EditProfilePhoneTextFormField({
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
  State<EditProfilePhoneTextFormField> createState() =>
      _EditProfilePhoneTextFormFieldState();
}

class _EditProfilePhoneTextFormFieldState
    extends State<EditProfilePhoneTextFormField> {
  final FocusNode _focusNode = FocusNode();
  late final String _lockedPrefix;
  bool readOnly = true;

  @override
  void initState() {
    super.initState();

    // 👈 استخراج +9627 من الرقم القادم من الداتابيز
    _lockedPrefix = widget.controller.text.startsWith('+9627') ? '+9627' : '';

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() => readOnly = true);
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
            controller: widget.controller,
            focusNode: _focusNode,
            readOnly: readOnly,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            onChanged: widget.onChanged,
            cursorColor: AppColors.primary,
            style: AppTextStyle.semiBold18,
            inputFormatters: _lockedPrefix.isEmpty
                ? null
                : [
                    LockedPrefixPhoneFormatter(
                      prefix: _lockedPrefix,
                      totalLength: 13,
                    ),
                  ],

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
              setState(() => readOnly = false);
              FocusScope.of(context).requestFocus(_focusNode);
            },
          ),
      ],
    );
  }
}
