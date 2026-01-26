import 'package:flutter/material.dart';
import 'package:thameen/core/utils/helper/get_match_color.dart';

class MatchProgressIndicator extends StatelessWidget {
  const MatchProgressIndicator({
    super.key,
    required this.percentage,
  });
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: (percentage * 100).round() / 100,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            getMatchColor((percentage * 100).round().toDouble()),
          ),
          minHeight: 8,
        ),
      ),
    );
  }
}
