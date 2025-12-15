import 'package:flutter/material.dart';
import 'package:thameen/features/home/presentation/widgets/home_categories.dart';
import 'package:thameen/features/home/presentation/widgets/home_header.dart';
import 'package:thameen/features/home/presentation/widgets/home_search_bar.dart';
import 'package:thameen/features/home/presentation/widgets/recent_Items.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(),
          SizedBox(height: 24),
          HomeSearchBar(),
          SizedBox(height: 24),
          HomeCategories(),
          SizedBox(height: 24),
          RecentItems(),
        ],
      ),
    );
  }
}
