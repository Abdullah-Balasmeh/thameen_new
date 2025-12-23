import 'package:flutter/material.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

class ContactMethodsCheckBoxes extends StatefulWidget {
  const ContactMethodsCheckBoxes({
    super.key,
    required this.selectedContactMethods,
  });

  final ValueNotifier<List<ContactMethod>> selectedContactMethods;

  @override
  State<ContactMethodsCheckBoxes> createState() =>
      _ContactMethodsCheckBoxesState();
}

class _ContactMethodsCheckBoxesState extends State<ContactMethodsCheckBoxes> {
  final List<ContactMethod> contactMethods = ContactMethod.values;

  String _label(ContactMethod method) {
    switch (method) {
      case ContactMethod.mobilePhone:
        return 'Mobile Phone';
      case ContactMethod.inAppChat:
        return 'In App Chat';
      case ContactMethod.email:
        return 'Email';
    }
  }

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
            title: Text(_label(method)),
            value: isSelected,
            onChanged: (checked) {
              final updatedList = List<ContactMethod>.from(
                widget.selectedContactMethods.value,
              );

              if (checked == true) {
                updatedList.add(method);
              } else {
                updatedList.remove(method);
              }

              widget.selectedContactMethods.value = updatedList;
              setState(() {});
            },
            activeColor: Theme.of(context).colorScheme.primary,
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          );
        }).toList(),
      ),
    );
  }
}
