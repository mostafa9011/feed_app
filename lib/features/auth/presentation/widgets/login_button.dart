import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes/page_name.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/functions/kprint.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../../../core/utils/widgets/show_toast.dart';
import '../cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  final formKey;
  final emailController;
  final passwordController;

  const LoginButton({
    super.key,
    this.formKey,
    this.emailController,
    this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // error state
        if (state.isLoginFailure) {
          kprint("Login Failed: ${state.errorMessage}");
          showToast(
            context: context,
            type: ToastType.error,
            message: state.errorMessage!,
          );
        }

        // success state

        if (state.isLoginSuccess) {
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
          current.status == AuthStatus.loginLoading ||
          current.status == AuthStatus.loginSuccess ||
          current.status == AuthStatus.loginFailure,
      builder: (context, state) {
        return CustomElevatedButton(
          isLoading: state.isLoginLoading,
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;

            await context.read<AuthCubit>().login(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
          },
          text: context.tr.login,
          textColor: context.colorScheme.surface,
        );
      },
    );
  }
}
