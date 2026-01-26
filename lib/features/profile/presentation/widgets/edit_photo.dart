import 'package:flutter/material.dart';
import 'package:thameen/generated/l10n.dart';

class EditPhoto extends StatelessWidget {
  const EditPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(S.of(context).editPhoto),
    );
  }
}
