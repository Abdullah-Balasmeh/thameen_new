import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/home/presentation/widgets/sort_by_container.dart';
import 'package:thameen/generated/l10n.dart';

class SortBy extends StatelessWidget {
  const SortBy({super.key, required this.selectedSort});

  final ValueNotifier<String> selectedSort;

  static List<String> sortOptions = [
    S.current.mostRecent,
    S.current.oldestFirst,
    S.current.sortAZ,
    S.current.sortZA,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.current.sortBy, style: AppTextStyle.medium16),
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
