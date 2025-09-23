import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/widgets/fields/password_fields.dart';
import '../../../../core/utils/widgets/fields/text_field/custom_text_form_field.dart';
import '../../data/form_data/signup_form_data.dart';
import 'signup_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  SignupFormData formData = SignupFormData();

  @override
  void dispose() {
    formData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formData.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: context.tr.username,
            controller: formData.usernameController,
          ),
          SizedBox(height: 24.h),
          CustomTextFormField(
            hintText: context.tr.email,
            keyboardType: TextInputType.emailAddress,
            controller: formData.emailController,
          ),
          SizedBox(height: 24.h),
          PasswordFields(
            passwordController: formData.passwordController,
            passwordHint: context.tr.password,
          ),
          SizedBox(height: 24.h),

          // signup button
          SignupButton(formData: formData),
        ],
      ),
    );
  }
}
