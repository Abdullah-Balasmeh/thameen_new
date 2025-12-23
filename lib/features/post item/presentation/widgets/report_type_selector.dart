import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/post%20item/presentation/widgets/report_type_button.dart';

class ReportTypeSelector extends StatelessWidget {
  const ReportTypeSelector({super.key, required this.selectedType});
  final ValueNotifier<PostType> selectedType;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedType,
      builder: (context, value, _) {
        return Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ReportTypeButton(
                  label: 'Lost',
                  icon: Icons.search,
                  isSelected: value == PostType.lost,
                  color: AppColors.error,
                  onTap: () {
                    selectedType.value = PostType.lost;
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ReportTypeButton(
                  label: 'Found',
                  icon: Icons.done_all,
                  isSelected: value == PostType.found,
                  color: AppColors.success,
                  onTap: () {
                    selectedType.value = PostType.found;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
