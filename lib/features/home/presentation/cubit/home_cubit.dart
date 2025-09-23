import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
}
