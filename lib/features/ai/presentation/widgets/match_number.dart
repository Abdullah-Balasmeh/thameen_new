import 'package:flutter/material.dart';

class MatchNumber extends StatelessWidget {
  const MatchNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 16,
      backgroundColor: Color(0xFF4CAF50),
      child: Text(
        '1',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
