import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/ai/data/models/ai_match_model.dart';
import 'package:thameen/features/home/domain/entities/poster_entity.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/shared/services/ai_service.dart';
import 'package:thameen/shared/services/firestore_service.dart';

part 'ai_state.dart';

class AiSearchCubit extends Cubit<AiSearchState> {
  final AiService aiService;
  final FirestoreService firestoreService = FirestoreService();

  bool isSearching = false;
  AiSearchCubit({
    required this.aiService,
  }) : super(AiSearchInitial());

  Future<void> searchByImage(File image) async {
    emit(AiSearchLoading());
    isSearching = true;

    final results = await aiService.searchByImage(image);

    isSearching = false;

    results.fold(
      (failure) {
        emit(AiSearchFailure(failure.errorMessage));
      },
      (matches) {
        // ✅ فلترة النتائج (أعلى من أو يساوي 20%)
        final filteredResults = matches
            .where((match) => match.score >= 0.2)
            .toList();

        if (filteredResults.isEmpty) {
          emit(AiSearchFailure('No strong matches found'));
        } else {
          emit(AiSearchSuccess(filteredResults));
        }
      },
    );
  }

  Future<PostEntity> getPostDataByPostId(String postId) async {
    try {
      final postData = await firestoreService.getData(
        path: 'posts',
        documentId: postId,
      );
      final post = PostEntity(
        id: postData['id'] as String,
        userId: postData['userId'] as String,
        postType: getPostType(postData['postType'] as String),
        itemName: postData['itemName'] as String,
        itemCategory: postData['itemCategory'] as String,
        itemDescription: postData['itemDescription'] as String,
        location: postData['location'] as String,
        bountyAmount: (postData['bountyAmount'] as num).toDouble(),
        postAnonymously: postData['postAnonymously'] as bool,
        contactMethods: (postData['contactMethods'] as List<dynamic>)
            .map((e) => ContactMethod.values.byName(e as String))
            .toList(),
        photoUrls: List<String>.from(postData['photoUrls'] as List<dynamic>),
        createdAt: (postData['createdAt'] as Timestamp).toDate(),
        postState: getPostState(postData['postState'] as String),
      );
      return post;
    } catch (e) {
      log('Error: ${e.toString()}');
      rethrow;
    }
  }

  Future<PosterEntity> getUserDataByPostId(String postId) async {
    try {
      final userData = await firestoreService.getUserByPostId(postId);
      final poster = PosterEntity(
        id: userData['id'] as String,
        firstName: userData['firstName'] as String,
        lastName: userData['lastName'] as String,
        phoneNumber: userData['phoneNumber'] as String,
        email: userData['email'] as String,
        photoUrl: userData['photoUrl'] as String,
      );
      return poster;
    } catch (e) {
      log('Error: ${e.toString()}');
      rethrow;
    }
  }

  void reset() {
    isSearching = false;
    emit(AiSearchInitial());
  }
}
