import 'package:flutter/material.dart';

class AnonymousToggle extends StatefulWidget {
  const AnonymousToggle({super.key, required this.postAnonymously});
  final ValueNotifier<bool> postAnonymously;
  @override
  State<AnonymousToggle> createState() => _AnonymousToggleState();
}

class _AnonymousToggleState extends State<AnonymousToggle> {
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
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Post Anonymously',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Hide your identity from other users',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: widget.postAnonymously.value,
            onChanged: (value) {
              setState(() {
                widget.postAnonymously.value = value;
              });
            },
            activeThumbColor: const Color(0xff0D61AD),
          ),
        ],
      ),
    );
  }
}
