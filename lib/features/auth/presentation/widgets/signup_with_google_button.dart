import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';

class SignupWithGoogleButton extends StatelessWidget {
  const SignupWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {},
      text: context.tr.signupWithGoogle,
      backgroundColor: context.colorScheme.onSecondary,
    );
  }
}
