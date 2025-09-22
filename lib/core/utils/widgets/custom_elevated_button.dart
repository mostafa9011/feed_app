import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/themes/text_styles.dart';
import '../extensions/context_extension.dart';
import 'spinket_loader.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final double width;
  final double height;
  final bool isDisabled;
  final bool isLoading;

  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.width = 1,
    this.height = 48,
    this.borderRadius = 24,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SpinketLoader();
    }

    return SizedBox(
      height: 50.h,
      width: width == 1 ? width.sw : width.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? context.colorScheme.onSecondary
              : backgroundColor ?? context.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Text(
          text,
          style: TextStyles.boldW16Black(context).copyWith(color: textColor),
        ),
      ),
    );
  }
}
