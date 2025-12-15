import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'iPhone 13 Pro',
        'location': 'Amman, University of Jordan',
        'date': '2 hours ago',
        'type': 'Lost',
        'color': AppColors.error,
      },
      {
        'title': 'Black Leather Wallet',
        'location': 'Amman, Abdali',
        'date': '5 hours ago',
        'type': 'Found',
        'color': AppColors.success,
      },
      {
        'title': 'Toyota Car Keys',
        'location': 'Irbid, Yarmouk University',
        'date': '1 day ago',
        'type': 'Lost',
        'color': AppColors.error,
      },
      {
        'title': 'Blue Backpack',
        'location': 'Zarqa, Sports City',
        'date': '2 days ago',
        'type': 'Found',
        'color': AppColors.success,
      },
      {
        'title': 'Rolex Watch',
        'location': 'Amman, City Mall',
        'date': '3 days ago',
        'type': 'Lost',
        'color': AppColors.error,
      },
    ];

    final item = items[index];

    return GestureDetector(
      onTap: () {
        // Handle item tap
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBackground.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.image_outlined,
              color: Colors.grey[400],
              size: 30,
            ),
          ),
          title: Text(
            item['title'] as String,
            style: AppTextStyle.bold20,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppColors.error,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      item['location'] as String,
                      style: AppTextStyle.medium14.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                item['date'] as String,
                style: AppTextStyle.medium14.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
          trailing: Container(
            width: 50,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: (item['color'] as Color).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              item['type'] as String,
              style: AppTextStyle.medium14.copyWith(
                color: item['color'] as Color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
