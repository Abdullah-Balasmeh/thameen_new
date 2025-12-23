import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/post%20item/domain/repositories/post_repository.dart';
import 'package:thameen/shared/services/firebase_storage.dart';
import 'package:uuid/uuid.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final PostRepository postRepository;
  final FirebaseStorageService storageService;

  CreatePostCubit({
    required this.postRepository,
    required this.storageService,
  }) : super(CreatePostInitial());

  Future<void> createPost({
    required String userId,
    required PostType postType,
    required String itemName,
    required String itemCategory,
    required String itemDescription,
    required String location,
    required double bountyAmount,
    required bool postAnonymously,
    required List<ContactMethod> contactMethods,
    required List<File> photos,
  }) async {
    emit(CreatePostLoading());

    try {
      // 1️⃣ Generate postId
      final postId = const Uuid().v4();

      // 2️⃣ Upload images
      final photoUrls = await storageService.uploadPostImages(
        postId: postId,
        images: photos,
      );

      // 3️⃣ Create PostEntity
      final post = PostEntity(
        id: postId,
        userId: userId,
        postType: postType,
        itemName: itemName,
        itemCategory: itemCategory,
        itemDescription: itemDescription,
        location: location,
        bountyAmount: bountyAmount,
        postAnonymously: postAnonymously,
        contactMethods: contactMethods,
        photoUrls: photoUrls,
        createdAt: DateTime.now(),
        postState: PostState.active,
      );
      log('post: ${post.toMap()}');
      // 4️⃣ Save to Firestore
      await postRepository.createPost(post);

      emit(CreatePostSuccess());
    } catch (e) {
      log('Error: ${e.toString()}');
      emit(
        CreatePostFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
