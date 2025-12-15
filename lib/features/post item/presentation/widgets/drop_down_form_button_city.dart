import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/border_builder.dart';

class DropDownFormButtonCity extends StatefulWidget {
  const DropDownFormButtonCity({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.keyboardType,
    this.validator,
    required this.controller,
    this.autovalidateMode,
    this.onChanged,
    this.textInputAction,
    required this.city,
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
  final List<String> city;
  @override
  State<DropDownFormButtonCity> createState() => _DropDownFormButtonCityState();
}

class _DropDownFormButtonCityState extends State<DropDownFormButtonCity> {
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
    return DropdownButtonFormField<String>(
      borderRadius: BorderRadius.circular(16),
      style: AppTextStyle.semiBold18.copyWith(
        color: AppColors.darkBackground,
      ),
      icon: Transform.rotate(
        angle: -90 * 3.141592653589793 / 180, // 180 degrees in radians
        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: isFocused
              ? AppColors.primary
              : theme.textTheme.bodyLarge!.color,
        ),
      ),
      iconEnabledColor: isFocused
          ? AppColors.primary
          : theme.textTheme.bodyLarge!.color,
      focusNode: _focusNode,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      items: widget.city.map((city) {
        return DropdownMenuItem(
          value: city,
          child: Text(
            city,
            style: AppTextStyle.semiBold18.copyWith(
              color: theme.textTheme.bodyLarge!.color,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        widget.onChanged!(value!);
      },

      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: AppTextStyle.medium16.copyWith(
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
          color: isFocused
              ? AppColors.primary
              : theme.textTheme.bodyLarge!.color,
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
