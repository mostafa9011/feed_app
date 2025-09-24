import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/extensions/context_extension.dart';

class CustomHashtag extends StatelessWidget {
  const CustomHashtag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6).r,
      decoration: BoxDecoration(
        color: context.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        "#design",
        style: TextStyles.medium16WBlack(context).copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}
