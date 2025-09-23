import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/routes/page_name.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/functions/kprint.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../../../core/utils/widgets/show_toast.dart';
import '../../data/form_data/signup_form_data.dart';
import '../cubit/auth_cubit.dart';

class SignupButton extends StatelessWidget {
  final SignupFormData formData;

  const SignupButton({required this.formData, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // error state
        if (state.isSignupFailure) {
          kprint("Signup Failed: ${state.errorMessage}");
          showToast(
            context: context,
            type: ToastType.error,
            message: state.errorMessage!,
          );
        }

        // success stata

        if (state.isSignupSuccess) {
          showToast(
            context: context,
            type: ToastType.success,
            message: "Signup Successfully",
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            PageName.layoutScreen,
            (route) => false,
          );
        }
      },
      buildWhen: (previous, current) =>
          current.status == AuthStatus.signupLoading ||
          current.status == AuthStatus.signupSuccess ||
          current.status == AuthStatus.signupFailure,
      builder: (context, state) {
        return CustomElevatedButton(
          isLoading: state.isSignupLoading,
          onPressed: () async {
            if (!formData.formKey.currentState!.validate()) return;

            await context.read<AuthCubit>().signup(
                  username: formData.usernameController.text.trim(),
                  email: formData.emailController.text.trim(),
                  password: formData.passwordController.text.trim(),
                );
          },
          text: context.tr.signup,
          textColor: context.colorScheme.surface,
        );
      },
    );
  }
}
