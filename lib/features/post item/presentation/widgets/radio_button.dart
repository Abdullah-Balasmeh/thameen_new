import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final bool value;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  bool offerBounty = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          offerBounty = widget.value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: offerBounty == widget.value
              ? const Color(0xff0D61AD).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: offerBounty == widget.value
                ? const Color(0xff0D61AD)
                : Colors.grey[300]!,
          ),
        ),
        child: Row(
          children: [
            Icon(
              offerBounty == widget.value
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: offerBounty == widget.value
                  ? const Color(0xff0D61AD)
                  : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 4),
            Text(
              widget.label,
              style: TextStyle(
                color: offerBounty == widget.value
                    ? const Color(0xff0D61AD)
                    : Colors.grey,
                fontWeight: offerBounty == widget.value
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
