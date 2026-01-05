import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/base/data/models/category.dart';
import 'package:thameen/features/home/presentation/bloc/all_posts_cubit/home_cubit.dart';
import 'package:thameen/features/home/presentation/widgets/active_home_category_card.dart';
import 'package:thameen/features/home/presentation/widgets/non_active_home_category_card.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  final List<Category> categories = [
    Category(
      name: 'All Items',
      icons: Icons.menu_rounded,
      color: Colors.orange,
    ),
    Category(
      name: 'Electronics',
      icons: Icons.devices,
      color: Colors.blue,
    ),
    Category(
      name: 'Documents',
      icons: Icons.edit_document,
      color: Colors.purple,
    ),
    Category(
      name: 'Accessories',
      icons: Icons.watch,
      color: Colors.yellowAccent,
    ),
    Category(
      name: 'Money',
      icons: Icons.money,
      color: Colors.green,
    ),
    Category(
      name: 'Clothing',
      icons: Icons.dry_cleaning,
      color: Colors.pink,
    ),

    Category(
      name: 'Bags',
      icons: Icons.shopping_bag,
      color: Colors.teal,
    ),
    Category(
      name: 'Pets',
      icons: Icons.pets,
      color: Colors.brown,
    ),

    Category(
      name: 'Other',
      icons: Icons.more_horiz,
      color: Colors.grey,
    ),
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Categories',
            style: AppTextStyle.bold24.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      context.read<HomeCubit>().filterPosts(
                        category: category.name,
                      );
                    });
                  },
                  child: selectedIndex == index
                      ? ActiveHomeCategoryCard(
                          icon: category.icons,
                          label: category.name,
                          color: category.color,
                        )
                      : NonActiveHomeCategoryCard(
                          icon: category.icons,
                          label: category.name,
                          color: category.color,
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
