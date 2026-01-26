import 'package:flutter/material.dart';
import 'package:thameen/generated/l10n.dart';

class BountyToggle extends StatefulWidget {
  const BountyToggle({super.key, required this.hasBounty});
  final ValueNotifier<bool> hasBounty;
  @override
  State<BountyToggle> createState() => _BountyToggleState();
}

class _BountyToggleState extends State<BountyToggle> {
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
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).hasBounty,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                 Text(
                  S.of(context).hasBountyDesc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: widget.hasBounty.value,
            onChanged: (value) {
              setState(() {
                widget.hasBounty.value = value;
              });
            },
            activeThumbColor: const Color(0xff0D61AD),
          ),
        ],
      ),
    );
  }
}
