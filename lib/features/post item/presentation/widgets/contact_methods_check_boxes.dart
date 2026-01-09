import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

class ContactMethodsCheckBoxes extends StatefulWidget {
  const ContactMethodsCheckBoxes({
    super.key,
    required this.selectedContactMethods,
    required this.isAnonymously,
  });

  final ValueNotifier<List<ContactMethod>> selectedContactMethods;
  final ValueNotifier<bool> isAnonymously;

  @override
  State<ContactMethodsCheckBoxes> createState() =>
      _ContactMethodsCheckBoxesState();
}

class _ContactMethodsCheckBoxesState extends State<ContactMethodsCheckBoxes> {
  final List<ContactMethod> contactMethods = ContactMethod.values;
  @override
  void didUpdateWidget(covariant ContactMethodsCheckBoxes oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isAnonymously.value) {
      widget.selectedContactMethods.value = [ContactMethod.inAppChat];
    }
  }

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
    log('isAnonymously: ${widget.isAnonymously.value}');
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: widget.isAnonymously.value
            ? [
                CheckboxListTile(
                  title: Text(_label(ContactMethod.inAppChat)),
                  value: true,
                  onChanged: (checked) {},
                  activeColor: Theme.of(context).colorScheme.primary,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ]
            : contactMethods.map((method) {
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
