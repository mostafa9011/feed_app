import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../../../core/utils/widgets/fields/password_fields.dart';
import '../../../../core/utils/widgets/fields/text_field/custom_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: context.tr.username,
            controller: usernameController,
          ),
          SizedBox(height: 24.h),
          CustomTextFormField(
            hintText: context.tr.email,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          SizedBox(height: 24.h),
          PasswordFields(
            passwordController: passwordController,
            passwordHint: context.tr.password,
          ),
          SizedBox(height: 24.h),

          // signup button
          CustomElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              // Process the signup
            },
            text: context.tr.signup,
            textColor: context.colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
