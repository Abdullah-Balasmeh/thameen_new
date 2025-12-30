import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/home/presentation/bloc/all_posts_cubit/home_cubit.dart';
import 'package:thameen/features/home/presentation/widgets/home_categories.dart';
import 'package:thameen/features/home/presentation/widgets/home_header.dart';
import 'package:thameen/features/home/presentation/widgets/home_search_bar.dart';
import 'package:thameen/features/home/presentation/widgets/item_card.dart';
import 'package:thameen/features/home/presentation/widgets/no_reports_found.dart';
import 'package:thameen/features/home/presentation/widgets/recent_Items.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Map<String, dynamic> postsCount = {};
  @override
  void initState() {
    getPostsCount();
    context.read<HomeCubit>().getAllPosts();
    context.read<HomeCubit>().getRecentItems();
    super.initState();
  }

  Future<void> getPostsCount() async {
    postsCount = await context.read<HomeCubit>().getPostsCount();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(postsCount: postsCount),
          const SizedBox(height: 24),
          const HomeCategories(),
          const SizedBox(height: 24),
          const HomeSearchBar(),
          const SizedBox(height: 24),
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HomeFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              if (state is HomeRecentPostsSuccess) {
                if (state.posts.isEmpty) {
                  return const NoReportsFound();
                }
                final posts = state.posts;
                return Column(
                  children: [
                    const RecentItems(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ItemCard(post: posts[index]),
                        );
                      },
                    ),
                  ],
                );
              }

              if (state is HomeSearchSuccess) {
                if (state.posts.isEmpty) {
                  return const NoReportsFound();
                }
                final posts = state.posts;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ItemCard(post: posts[index]),
                    );
                  },
                );
              }
              return const NoReportsFound();
            },
          ),
        ],
      ),
    );
  }
}
