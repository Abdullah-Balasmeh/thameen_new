import 'package:flutter/material.dart';
import 'package:thameen/core/utils/helper/get_match_color.dart';

class MatchPercentage extends StatelessWidget {
  const MatchPercentage({
    super.key,
    required this.percentage,
  });
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(percentage * 100).round()}% Match',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: getMatchColor(percentage * 100),
      ),
    );
  }
}
