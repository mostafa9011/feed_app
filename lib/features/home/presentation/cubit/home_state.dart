part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  getSuggestedUsersLoading,
  getSuggestedUsersSuccess,
  getSuggestedUsersFailure,
}

@immutable
class HomeState {
  final HomeStatus status;
  final String? errorMessage;
  final List<SuggestedUserEntity>? suggestedUsers;

  const HomeState({
    required this.status,
    this.errorMessage,
    this.suggestedUsers,
  });

  HomeState copyWith({
    required HomeStatus status,
    String? errorMessage,
    List<SuggestedUserEntity>? suggestedUsers,
  }) {
    return HomeState(
      status: status,
      errorMessage: errorMessage ?? this.errorMessage,
      suggestedUsers: suggestedUsers ?? this.suggestedUsers,
    );
  }

  bool get isGetSuggestedUsersLoading =>
      status == HomeStatus.getSuggestedUsersLoading;
  bool get isGetSuggestedUsersSuccess =>
      status == HomeStatus.getSuggestedUsersSuccess;
  bool get isGetSuggestedUsersFailure =>
      status == HomeStatus.getSuggestedUsersFailure;
}
