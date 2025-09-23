import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_language_drop_down.dart';
import '../widgets/toggle_dark_mode.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // language drop down
        const CustomLanguageDropDown(),
        SizedBox(height: 32.h),

        // enable dark mode
        const ToggleDarkMode(),
      ],
    );
  }
}
