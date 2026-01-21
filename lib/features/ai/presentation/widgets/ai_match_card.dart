import 'package:flutter/material.dart';
import 'package:thameen/features/ai/presentation/widgets/match_number.dart';
import 'package:thameen/features/ai/presentation/widgets/match_percentage.dart';
import 'package:thameen/features/ai/presentation/widgets/match_post_details.dart';
import 'package:thameen/features/ai/presentation/widgets/match_progress_indicator.dart';

class AiMatchCard extends StatelessWidget {
  const AiMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF4CAF50).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF4CAF50).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: const Row(
              children: [
                MatchNumber(),
                SizedBox(width: 12),
                MatchPercentage(),
                Spacer(),
                MatchProgressIndicator(),
              ],
            ),
          ),
          const MatchPostDetails(),
        ],
      ),
    );
  }
}
