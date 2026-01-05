import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/home/presentation/widgets/sort_by_container.dart';

class SortBy extends StatelessWidget {
  const SortBy({super.key, required this.selectedSort});

  final ValueNotifier<String> selectedSort;

  static const List<String> sortOptions = [
    'Most Recent',
    'Oldest First',
    'A-Z',
    'Z-A',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sort By', style: AppTextStyle.medium16),
        const SizedBox(height: 16),

        ValueListenableBuilder<String>(
          valueListenable: selectedSort,
          builder: (_, value, __) {
            return Row(
              children: List.generate(sortOptions.length, (index) {
                return SortByContainer(
                  label: sortOptions[index],
                  isSelected: value == sortOptions[index],
                  onTap: () {
                    selectedSort.value = sortOptions[index];
                  },
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
