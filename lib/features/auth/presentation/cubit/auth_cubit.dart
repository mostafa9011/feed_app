import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository)
      : super(AuthState(status: AuthStatus.initial));

  final AuthRepository _authRepository;

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(status: AuthStatus.loginLoading));

    final result = await _authRepository.signIn(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.loginFailure,
          errorMessage: failure.message,
        ),
      ),
      (user) {
        emit(state.copyWith(status: AuthStatus.loginSuccess, user: user));
      },
    );
  }

  Future<void> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.signupLoading));

    final result = await _authRepository.signUp(
      username: username,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.signupFailure,
          errorMessage: failure.message,
        ),
      ),
      (user) {
        emit(state.copyWith(status: AuthStatus.signupSuccess, user: user));
      },
    );
  }
}
