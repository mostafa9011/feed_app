part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  getSuggestedUsersLoading,
  getSuggestedUsersSuccess,
  getSuggestedUsersFailure,

  createPostLoading,
  createPostSuccess,
  createPostFailure,

  getPostsLoading,
  getPostsSuccess,
  getPostsFailure,

  toggleLikeLoading,
  toggleLikeSuccess,
  toggleLikeFailure,
}

@immutable
class HomeState {
  final HomeStatus status;
  final String? errorMessage;
  final List<SuggestedUserEntity>? suggestedUsers;
  final List<PostModel>? posts;

  const HomeState({
    required this.status,
    this.errorMessage,
    this.suggestedUsers,
    this.posts,
  });

  HomeState copyWith({
    required HomeStatus status,
    String? errorMessage,
    List<SuggestedUserEntity>? suggestedUsers,
    List<PostModel>? posts,
  }) {
    return HomeState(
      status: status,
      errorMessage: errorMessage ?? this.errorMessage,
      suggestedUsers: suggestedUsers ?? this.suggestedUsers,
      posts: posts ?? this.posts,
    );
  }

  bool get isGetSuggestedUsersLoading =>
      status == HomeStatus.getSuggestedUsersLoading;
  bool get isGetSuggestedUsersSuccess =>
      status == HomeStatus.getSuggestedUsersSuccess;
  bool get isGetSuggestedUsersFailure =>
      status == HomeStatus.getSuggestedUsersFailure;

  bool get isCreatePostLoading => status == HomeStatus.createPostLoading;
  bool get isCreatePostSuccess => status == HomeStatus.createPostSuccess;
  bool get isCreatePostFailure => status == HomeStatus.createPostFailure;

  bool get isGetPostsLoading => status == HomeStatus.getPostsLoading;
  bool get isGetPostsSuccess => status == HomeStatus.getPostsSuccess;
  bool get isGetPostsFailure => status == HomeStatus.getPostsFailure;

  bool get isToggleLikeLoading => status == HomeStatus.toggleLikeLoading;
  bool get isToggleLikeSuccess => status == HomeStatus.toggleLikeSuccess;
  bool get isToggleLikeFailure => status == HomeStatus.toggleLikeFailure;
}
