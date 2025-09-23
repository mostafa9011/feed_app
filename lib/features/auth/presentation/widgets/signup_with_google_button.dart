import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes/page_name.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/functions/kprint.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../../../core/utils/widgets/show_toast.dart';
import '../cubit/auth_cubit.dart';

class SignupWithGoogleButton extends StatelessWidget {
  const SignupWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // error state
        if (state.isSigninWithGoogleFailure) {
          kprint("Login Failed: ${state.errorMessage}");
          showToast(
            context: context,
            type: ToastType.error,
            message: state.errorMessage!,
          );
        }

        // success state

        if (state.isSigninWithGoogleSuccess) {
          showToast(
            context: context,
            type: ToastType.success,
            message: "Login Successfully",
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            PageName.layoutScreen,
            (route) => false,
          );
        }
      },
      buildWhen: (previous, current) =>
          current.status == AuthStatus.signinWithGoogleLoading ||
          current.status == AuthStatus.signinWithGoogleSuccess ||
          current.status == AuthStatus.signinWithGoogleFailure,
      builder: (context, state) {
        return CustomElevatedButton(
          isLoading: state.isSigninWithGoogleLoading,
          onPressed: () async {
            await context.read<AuthCubit>().signInWithGoogle();
          },
          text: context.tr.signupWithGoogle,
          backgroundColor: context.colorScheme.onSecondary,
        );
      },
    );
  }
}
