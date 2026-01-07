import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/home/presentation/widgets/bounty_toggle.dart';
import 'package:thameen/features/home/presentation/widgets/post_type_container.dart';

class FilterByPostType extends StatefulWidget {
  const FilterByPostType({
    super.key,
    required this.selectedType,
    required this.hasBounty,
  });

  final ValueNotifier<String> selectedType;
  final ValueNotifier<bool> hasBounty;

  @override
  State<FilterByPostType> createState() => _FilterByPostTypeState();
}

class _FilterByPostTypeState extends State<FilterByPostType> {
  List<String> postTypes = ['All', 'Lost', 'Found'];
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
          valueListenable: widget.selectedType,
          builder: (_, value, __) {
            return Column(
              children: [
                Row(
                  children: List.generate(postTypes.length, (index) {
                    return PostTypeContainer(
                      label: postTypes[index],
                      isSelected: value == postTypes[index],
                      onTap: () {
                        widget.selectedType.value = postTypes[index];
                      },
                    );
                  }),
                ),
                const SizedBox(height: 16),
                if (widget.selectedType.value == 'Lost')
                  BountyToggle(
                    hasBounty: widget.hasBounty,
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
