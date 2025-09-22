import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../../../core/utils/widgets/fields/password_fields.dart';
import '../../../../core/utils/widgets/fields/text_field/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
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

          // login button
          CustomElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              // Process the login
            },
            text: context.tr.login,
            textColor: context.colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
