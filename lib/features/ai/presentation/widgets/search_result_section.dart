import 'package:flutter/material.dart';
import 'package:thameen/features/ai/data/models/ai_match_model.dart';
import 'package:thameen/features/ai/presentation/widgets/ai_match_card.dart';
import 'package:thameen/features/ai/presentation/widgets/browse_all_button.dart';
import 'package:thameen/features/ai/presentation/widgets/search_again_button.dart';
import 'package:thameen/features/ai/presentation/widgets/search_result_header.dart';

class SearchResultSection extends StatelessWidget {
  const SearchResultSection({super.key, required this.results});
  final List<AiMatchModel> results;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const SearchResultHeader(),
        const SizedBox(height: 16),
        ...results.asMap().entries.map(
          (e) => AiMatchCard(
            index: e.key + 1,
            match: e.value,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: SearchAgainButton(),
              ),
              SizedBox(width: 12),
              Expanded(
                child: BrowseAllButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
