import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../widgets/custom_auth_hint_widget.dart';
import '../widgets/signup_form.dart';
import '../widgets/signup_with_google_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Text(
                  context.tr.createAnAccount,
                  style: TextStyles.boldW24Black(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),

                // signup form
                const SignupForm(),
                SizedBox(height: 24.h),

                // signup with google button
                const SignupWithGoogleButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 32).r,
        child: CustomAuthHintWidget(
          text: context.tr.alreadyHaveAccount,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
