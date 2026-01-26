import 'package:flutter/material.dart';
import 'package:thameen/core/utils/helper/get_match_color.dart';

class MatchNumber extends StatelessWidget {
  const MatchNumber({
    super.key,
    required this.index,
    required this.percentage,
  });
  final int index;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: getMatchColor(percentage * 100),
      child: Text(
        '$index',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
