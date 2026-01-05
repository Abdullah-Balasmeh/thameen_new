import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/home/presentation/bloc/all_posts_cubit/home_cubit.dart';
import 'package:thameen/features/home/presentation/widgets/filter_bottom_sheet.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBackground.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for something...',
            prefixIcon: const Icon(Icons.search, color: AppColors.primary),
            suffixIcon: IconButton(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => const FilterBottomSheet(),
                );
              },
              icon: const Icon(Icons.tune),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
          onChanged: (value) {
            context.read<HomeCubit>().filterPosts(itemName: value);
          },
          onSubmitted: (value) {
            context.read<HomeCubit>().filterPosts(itemName: value);
          },
        ),
      ),
    );
  }
}
