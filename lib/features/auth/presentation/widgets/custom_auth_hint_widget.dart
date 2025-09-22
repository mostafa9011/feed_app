import 'package:flutter/material.dart';

import '../../../../core/config/themes/text_styles.dart';

class CustomAuthHintWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const CustomAuthHintWidget({required this.text, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyles.regular14Secondary(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}
