import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/home/presentation/widgets/post_type_container.dart';

class FilterByPostType extends StatelessWidget {
  const FilterByPostType({super.key, required this.selectedType});

  final ValueNotifier<String> selectedType;

  static const List<String> postTypes = ['All', 'Lost', 'Found'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by Post Type',
          style: AppTextStyle.medium16,
        ),
        const SizedBox(height: 16),

        ValueListenableBuilder<String>(
          valueListenable: selectedType,
          builder: (_, value, __) {
            return Row(
              children: List.generate(postTypes.length, (index) {
                return PostTypeContainer(
                  label: postTypes[index],
                  isSelected: value == postTypes[index],
                  onTap: () {
                    selectedType.value = postTypes[index];
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
