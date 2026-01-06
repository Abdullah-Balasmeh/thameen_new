import 'package:flutter/material.dart';

class ChatDivider extends StatelessWidget {
  const ChatDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
