import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

class UpdateStatusBottomSheet extends StatelessWidget {
  final PostState currentStatus;
  final Function(PostState) onStatusChanged;

  const UpdateStatusBottomSheet({
    super.key,
    required this.currentStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Update Status',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTextStyle.medium14.color,
            ),
          ),
          const SizedBox(height: 24),
          _StatusOption(
            icon: Icons.check_circle_outline,
            label: 'ACTIVE',
            isSelected: currentStatus == PostState.active,
            color: AppColors.primary,
            onTap: () {
              onStatusChanged(PostState.active);
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12),
          _StatusOption(
            icon: Icons.check_circle,
            label: 'RESOLVED',
            isSelected: currentStatus == PostState.resolved,
            color: AppColors.primary,
            onTap: () {
              onStatusChanged(PostState.resolved);
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12),
          _StatusOption(
            icon: Icons.cancel,
            label: 'DELETED',
            isSelected: currentStatus == PostState.deleted,
            color: AppColors.primary,
            onTap: () {
              _showDeleteDialog(context);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text(
          'Are you sure you want to delete this report?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            onPressed: () {
              onStatusChanged(PostState.deleted);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                'Delete',
                style: AppTextStyle.medium16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _StatusOption({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : AppColors.primary,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? color : AppTextStyle.medium14.color,
              size: 28,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? color : AppTextStyle.medium14.color,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check,
                color: color,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
