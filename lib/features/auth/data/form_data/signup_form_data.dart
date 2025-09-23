import 'package:flutter/material.dart';

class SignupFormData {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
