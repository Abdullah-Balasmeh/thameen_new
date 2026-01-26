import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/map_category_to_emoji.dart';
import 'package:thameen/features/ai/data/models/ai_match_model.dart';

class MatchPostDetails extends StatelessWidget {
  const MatchPostDetails({
    super.key,
    required this.match,
  });
  final AiMatchModel match;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                mapCategoryToEmoji(match.itemCategory),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 4),
              Text(
                match.itemCategory,
                style: TextStyle(
                  fontSize: 12,
                  color: AppTextStyle.bold24.color,
                ),
              ),
              const Spacer(),
              Text(
                '2 hours ago',
                style: TextStyle(
                  fontSize: 12,
                  color: AppTextStyle.bold24.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Title
          Text(
            match.itemName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTextStyle.bold24.color,
            ),
          ),
          const SizedBox(height: 8),
          // Description
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: match.photoUrls.isEmpty
                ? Icon(
                    Icons.image_outlined,
                    color: Colors.grey[400],
                    size: 30,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      match.photoUrls.first,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          // Location and contact
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: AppTextStyle.bold24.color,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  match.location,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTextStyle.bold24.color,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Contact owner
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Contact'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
