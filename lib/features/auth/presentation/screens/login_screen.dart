import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/routes/page_name.dart';
import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/dependency_injection/di.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/custom_auth_hint_widget.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100.h),
                  Text(
                    context.tr.loginToYourAccount,
                    style: TextStyles.boldW24Black(context),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),

                  // login form
                  const LoginForm(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 32).r,
          child: Builder(
            builder: (context) {
              final cubit = context.watch<AuthCubit>();

              return CustomAuthHintWidget(
                text: context.tr.dontHaveAccount,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PageName.signupScreen,
                    arguments: cubit,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
