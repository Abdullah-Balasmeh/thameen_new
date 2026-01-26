import 'package:flutter/material.dart';
import 'package:thameen/core/utils/helper/get_match_color.dart';
import 'package:thameen/features/ai/data/models/ai_match_model.dart';
import 'package:thameen/features/ai/presentation/widgets/item_card_ai.dart';
import 'package:thameen/features/ai/presentation/widgets/match_number.dart';
import 'package:thameen/features/ai/presentation/widgets/match_percentage.dart';
import 'package:thameen/features/ai/presentation/widgets/match_progress_indicator.dart';

class AiMatchCard extends StatelessWidget {
  const AiMatchCard({super.key, required this.index, required this.match});
  final int index;
  final AiMatchModel match;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: getMatchColor(match.score * 100).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: getMatchColor(match.score * 100).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: getMatchColor(match.score * 100).withValues(alpha: 0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                MatchNumber(index: index, percentage: match.score),
                const SizedBox(width: 12),
                MatchPercentage(percentage: match.score),
                const Spacer(),
                MatchProgressIndicator(percentage: match.score),
              ],
            ),
          ),
          // MatchPostDetails(match: match),
          ItemCardAi(post: match),
        ],
      ),
    );
  }
}
