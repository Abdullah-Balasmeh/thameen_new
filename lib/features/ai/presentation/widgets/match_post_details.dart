import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/helper/map_category_to_emoji.dart';

class MatchPostDetails extends StatelessWidget {
  const MatchPostDetails({
    super.key,
  });

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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Lost',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.error,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                mapCategoryToEmoji('Electronics'),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 4),
              Text(
                'Electronics',
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
            'Red T-Shirt',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTextStyle.bold24.color,
            ),
          ),
          const SizedBox(height: 8),
          // Description
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl vel ultrices ultrices, nunc nisl ultrices nisl, vel ultrices nisl nisl vel nisl.',
            style: TextStyle(
              fontSize: 14,
              color: AppTextStyle.bold24.color,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
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
                  'Amman, Jordan',
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
