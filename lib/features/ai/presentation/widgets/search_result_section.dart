import 'package:flutter/material.dart';
import 'package:thameen/features/ai/presentation/widgets/ai_match_card.dart';
import 'package:thameen/features/ai/presentation/widgets/browse_all_button.dart';
import 'package:thameen/features/ai/presentation/widgets/search_again_button.dart';
import 'package:thameen/features/ai/presentation/widgets/search_result_header.dart';

class SearchResultSection extends StatelessWidget {
  const SearchResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16),
        SearchResultHeader(),
        SizedBox(height: 16),
        AiMatchCard(),
        Padding(
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
