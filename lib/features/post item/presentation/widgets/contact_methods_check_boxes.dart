import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class ContactMethodsCheckBoxes extends StatefulWidget {
  const ContactMethodsCheckBoxes({
    super.key,
    required this.selectedContactMethods,
    required this.onChanged,
  });

  final ValueNotifier<List<String>> selectedContactMethods;
  final ValueChanged<List<String>> onChanged;

  @override
  State<ContactMethodsCheckBoxes> createState() =>
      _ContactMethodsCheckBoxesState();
}

class _ContactMethodsCheckBoxesState extends State<ContactMethodsCheckBoxes> {
  final List<String> contactMethods = [
    'Mobile Phone',
    'In-App Chat',
    'Email',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: contactMethods.map((method) {
          final isSelected = widget.selectedContactMethods.value.contains(
            method,
          );

          return CheckboxListTile(
            checkColor: AppColors.lightBorder,
            title: Text(method),
            value: isSelected,
            onChanged: (value) {
              final updatedList = List<String>.from(
                widget.selectedContactMethods.value,
              );

              if (value == true) {
                updatedList.add(method);
              } else {
                updatedList.remove(method);
              }

              widget.onChanged(updatedList); // 🔥 return result to parent

              setState(() {});
            },
            activeColor: AppColors.primary,
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          );
        }).toList(),
      ),
    );
  }
}
