import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/cloudinary_service.dart';
import '../../data/form_data/post_form_data.dart';
import '../../data/models/post_model.dart';
import '../../domain/entities/suggested_user_entity.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository)
      : super(const HomeState(status: HomeStatus.initial));

  final HomeRepository _homeRepository;

  Future<void> getSuggestedUsers() async {
    emit(state.copyWith(status: HomeStatus.getSuggestedUsersLoading));

    final result = await _homeRepository.getSuggestedUsers();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.getSuggestedUsersFailure,
          errorMessage: failure.message,
        ),
      ),
      (suggestedUsers) => emit(
        state.copyWith(
          status: HomeStatus.getSuggestedUsersSuccess,
          suggestedUsers: suggestedUsers,
        ),
      ),
    );
  }

  Future<void> createPost({required PostFormData formData}) async {
    emit(state.copyWith(status: HomeStatus.createPostLoading));

    // publish image to cloudinary and get url
    final imageUrl = await CloudinaryService.uploadImage(
      File(formData.imageFile!.path),
    );

    // upload failed
    if (imageUrl == null) {
      emit(
        state.copyWith(
          status: HomeStatus.createPostFailure,
          errorMessage: 'Image upload failed',
        ),
      );
      return;
    }
    // create post

    final post = PostModel(
      title: formData.titleController.text,
      description: formData.descriptionController.text,
      userId: FirebaseAuth.instance.currentUser!.uid,
      imageUrl: imageUrl,
    );

    final result = await _homeRepository.createPost(post: post);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.createPostFailure,
          errorMessage: failure.message,
        ),
      ),
      (success) {
        // add post to list
        emit(
          state.copyWith(
            status: HomeStatus.createPostSuccess,
            posts: [post, ...state.posts!],
          ),
        );
      },
    );
  }

  Future<void> getPosts() async {
    emit(state.copyWith(status: HomeStatus.getPostsLoading));

    final result = await _homeRepository.getPosts();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.getPostsFailure,
          errorMessage: failure.message,
        ),
      ),
      (posts) => emit(
        state.copyWith(
          status: HomeStatus.getPostsSuccess,
          posts: posts,
        ),
      ),
    );
  }

  Future<void> toggleLike({
    required String postId,
    required String userId,
  }) async {
    emit(state.copyWith(status: HomeStatus.toggleLikeLoading));

    final result =
        await _homeRepository.toggleLike(postId: postId, userId: userId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.toggleLikeFailure,
          errorMessage: failure.message,
        ),
      ),
      (success) => emit(
        state.copyWith(
          status: HomeStatus.toggleLikeSuccess,
        ),
      ),
    );
  }
}
