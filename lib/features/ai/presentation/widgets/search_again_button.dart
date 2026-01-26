import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/ai/presentation/bloc/ai/ai_cubit.dart';

class SearchAgainButton extends StatelessWidget {
  const SearchAgainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        context.read<AiSearchCubit>().reset();
      },
      icon: const Icon(Icons.refresh),
      label: const Text('Search Again'),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
