import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/text_styles.dart';
import '../../../extensions/context_extension.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final String? Function(String)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final bool filled;
  final Color? fillColor;
  final String? initialValue;
  final String? errorText;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.enabled = true,
    this.filled = true,
    this.fillColor,
    this.initialValue,
    this.errorText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      validator: (value) => _validator(context, value),
      initialValue: controller == null ? initialValue : null, // avoid conflict
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      readOnly: readOnly,
      enabled: enabled,
      minLines: minLines,
      maxLines: _getMaxLines(),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        errorText: errorText,
        hintText: capitalizeWords(hintText ?? ''),
        hintStyle: TextStyles.regular16Grey(context),
        filled: filled,
        fillColor: fillColor ?? theme.inputDecorationTheme.fillColor,
        prefixIconConstraints: BoxConstraints(
          minWidth: 50.w,
          maxHeight: context.isTablet ? 90.h : 75.h,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      style: TextStyles.regular16Grey(context),
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
    );
  }

  int _getMaxLines() {
    if (!obscureText) {
      if (maxLines > minLines) {
        return maxLines;
      }
      return minLines + 1; // Ensure at least one line is visible
    }
    return maxLines;
  }

  String? _validator(BuildContext context, String? value) {
    // If a custom validator is provided, call it
    if (validator != null) {
      return validator!(value ?? '');
    }

    // Check if the field is required and empty
    else if ((value == null || value.trim().isEmpty)) {
      return capitalizeWords(context.tr.fieldRequired);
    }

    return null;
  }
}

String capitalizeWords(String text) {
  return text.split(' ').map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1);
  }).join(' ');
}
