import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/home/presentation/bloc/all_posts_cubit/home_cubit.dart';
import 'package:thameen/features/home/presentation/widgets/filter_by_location.dart';
import 'package:thameen/features/home/presentation/widgets/filter_by_post_type.dart';
import 'package:thameen/features/home/presentation/widgets/sort_by.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/shared/widgets/app_button.dart';
import 'package:thameen/shared/widgets/bottom_sheet_close_container.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final ValueNotifier<String> selectedType = ValueNotifier('All');
  final TextEditingController locationController = TextEditingController();
  final ValueNotifier<String> selectedSort = ValueNotifier('Most Recent');
  final ValueNotifier<bool> hasBounty = ValueNotifier(false);

  @override
  void initState() {
    final cubit = context.read<HomeCubit>();

    // Post type
    selectedType.value =
        cubit.selectedType == null || cubit.selectedType == PostType.all
        ? 'All'
        : cubit.selectedType == PostType.lost
        ? 'Lost'
        : 'Found';

    // Sort
    selectedSort.value = cubit.selectedSort ?? 'Most Recent';

    // Location
    locationController.text = cubit.selectedLocation ?? '';

    // Has bounty
    hasBounty.value = cubit.selectedHasBounty ?? false;
    super.initState();
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetCloseContainer(),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Filter & Sort',
                  style: AppTextStyle.bold24,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    selectedType.value = 'All';
                    selectedSort.value = 'Most Recent';
                    hasBounty.value = false;
                    locationController.clear();

                    cubit.filterPosts(
                      type: PostType.all,
                      location: '',
                      sort: 'Most Recent',
                      hasBounty: false,
                    );
                  },
                  child: Text(
                    'Rest All',
                    style: AppTextStyle.medium16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: AppColors.lightBorder,
              thickness: 1,
              height: 1,
            ),
            const SizedBox(height: 16),
            FilterByPostType(
              selectedType: selectedType,
              hasBounty: hasBounty,
            ),
            const SizedBox(height: 16),
            FilterByLocation(
              locationController: locationController,
            ),
            const SizedBox(height: 16),
            SortBy(
              selectedSort: selectedSort,
            ),
            const SizedBox(height: 32),
            AppButton(
              onPressed: () {
                log('selectedType: ${selectedType.value}');
                log('location: ${locationController.text}');
                log('selectedSort: ${selectedSort.value}');
                homeCubit.filterPosts(
                  type: selectedType.value == 'All'
                      ? PostType.all
                      : selectedType.value == 'Lost'
                      ? PostType.lost
                      : PostType.found,
                  location: locationController.text,
                  sort: selectedSort.value,
                  hasBounty: hasBounty.value,
                );
                Navigator.pop(context);
              },
              child: Text(
                'Apply Filters',
                style: AppTextStyle.bold20,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
