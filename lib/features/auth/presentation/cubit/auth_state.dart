part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  loginLoading,
  loginSuccess,
  loginFailure,
  signupLoading,
  signupSuccess,
  signupFailure,
  signinWithGoogleLoading,
  signinWithGoogleSuccess,
  signinWithGoogleFailure
}

@immutable
class AuthState {
  final AuthStatus status;
  final String? errorMessage;
  final UserModel? user;

  AuthState({
    required this.status,
    this.errorMessage,
    this.user,
  });

  AuthState copyWith({
    required AuthStatus status,
    String? errorMessage,
    UserModel? user,
  }) {
    return AuthState(
      status: status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  bool get isLoginLoading => status == AuthStatus.loginLoading;
  bool get isLoginSuccess => status == AuthStatus.loginSuccess;
  bool get isLoginFailure => status == AuthStatus.loginFailure;
  bool get isSignupLoading => status == AuthStatus.signupLoading;
  bool get isSignupSuccess => status == AuthStatus.signupSuccess;
  bool get isSignupFailure => status == AuthStatus.signupFailure;
  bool get isSigninWithGoogleLoading =>
      status == AuthStatus.signinWithGoogleLoading;
  bool get isSigninWithGoogleSuccess =>
      status == AuthStatus.signinWithGoogleSuccess;
  bool get isSigninWithGoogleFailure =>
      status == AuthStatus.signinWithGoogleFailure;
}
