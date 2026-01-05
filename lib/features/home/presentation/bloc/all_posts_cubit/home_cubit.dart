import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/home/domain/entities/poster_entity.dart';
import 'package:thameen/features/home/domain/repositories/home_repo.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());
  List<PostEntity> posts = [];

  String? selectedCategory;
  PostType? selectedType;
  String? selectedLocation;
  String? searchQuery;
  String? selectedSort;
  Future<Map<String, dynamic>> getPostsCount() async {
    final count = await homeRepo.getPostsCount();
    return count;
  }

  Future<void> getAllPosts() async {
    posts = await homeRepo.getAllPosts();
  }

  Future<PosterEntity> getPosterDataById(String posterId) async {
    return await homeRepo.getPosterDataById(posterId);
  }

  void applyFilters() {
    emit(HomeLoading());

    try {
      List<PostEntity> filteredPosts = List.from(posts);

      if (selectedCategory != null && selectedCategory!.isNotEmpty) {
        if (selectedCategory == 'All Items') {
          filteredPosts = filteredPosts;
        } else {
          filteredPosts = filteredPosts
              .where((post) => post.itemCategory == selectedCategory)
              .toList();
        }
      }

      if (selectedType != null) {
        if (selectedType == PostType.all) {
          filteredPosts = filteredPosts;
        } else {
          filteredPosts = filteredPosts
              .where((post) => post.postType == selectedType)
              .toList();
        }
      }

      if (selectedLocation != null && selectedLocation!.isNotEmpty) {
        filteredPosts = filteredPosts
            .where((post) => post.location == selectedLocation)
            .toList();
      }

      if (searchQuery != null && searchQuery!.isNotEmpty) {
        final query = searchQuery!.toLowerCase();
        filteredPosts = filteredPosts.where((post) {
          return post.itemName.toLowerCase().contains(query) ||
              post.itemDescription.toLowerCase().contains(query);
        }).toList();
      }
      if (selectedSort != null) {
        filteredPosts.sort((a, b) {
          if (selectedSort == 'Most Recent') {
            return b.createdAt.compareTo(a.createdAt);
          } else if (selectedSort == 'Oldest First') {
            return a.createdAt.compareTo(b.createdAt);
          } else if (selectedSort == 'A-Z') {
            return a.itemName.compareTo(b.itemName);
          } else if (selectedSort == 'Z-A') {
            return b.itemName.compareTo(a.itemName);
          } else {
            return 0;
          }
        });
      }

      emit(HomeSearchSuccess(filteredPosts));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> filterPosts({
    String? category,
    PostType? type,
    String? location,
    String? itemName,
    String? sort,
  }) async {
    if (category != null) selectedCategory = category;
    if (type != null) selectedType = type;
    if (location != null) selectedLocation = location;
    if (itemName != null) searchQuery = itemName;
    if (sort != null) selectedSort = sort;

    applyFilters();
  }

  Future<void> getRecentItems() async {
    log('getRecentItems');
    emit(HomeLoading());
    try {
      final posts = await homeRepo.getRecentItems();
      log('posts: $posts');
      emit(HomeRecentPostsSuccess(posts));
    } catch (e) {
      log('Error: ${e.toString()}');
      emit(HomeFailure(e.toString()));
    }
  }
}


// all posts --> first 5 posts
// count found & lost
//filter by type
// filter by category
// filter by location 
//  filter  by item name