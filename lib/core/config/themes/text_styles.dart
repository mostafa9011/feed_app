import 'package:flutter/material.dart';

import '../../utils/extensions/context_extension.dart';
import '../../utils/size_manager.dart';

abstract class TextStyles {
  static const String plusJakartaFont = 'Plus Jakarta Sans';

  static TextStyle regular14Secondary(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(14),
        fontWeight: FontWeight.w400,
        color: context.colorScheme.secondary,
        fontFamily: plusJakartaFont,
      );

  static TextStyle regular16Secodary(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(16),
        fontWeight: FontWeight.w400,
        color: context.colorScheme.secondary,
        fontFamily: plusJakartaFont,
      );

  static TextStyle medium12WBlack(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(12),
        fontWeight: FontWeight.w500,
        color: context.colorScheme.onSurface,
        fontFamily: plusJakartaFont,
      );

  static TextStyle medium16WBlack(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(16),
        fontWeight: FontWeight.w500,
        color: context.colorScheme.onSurface,
        fontFamily: plusJakartaFont,
      );

  static TextStyle boldW13Secondary(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(13),
        fontWeight: FontWeight.w700,
        color: context.colorScheme.secondary,
        fontFamily: plusJakartaFont,
      );

  static TextStyle boldW16Black(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(16),
        fontWeight: FontWeight.w700,
        color: context.colorScheme.onSurface,
        fontFamily: plusJakartaFont,
      );

  static TextStyle boldW18Black(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(18),
        fontWeight: FontWeight.w700,
        color: context.colorScheme.onSurface,
        fontFamily: plusJakartaFont,
      );

  static TextStyle boldW24Black(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(24),
        fontWeight: FontWeight.w700,
        color: context.colorScheme.onSurface,
        fontFamily: plusJakartaFont,
      );

  static double getResponsiveFontSize(double fontSize) {
    final double scaleFactor = _getScaleFactor();
    final double responsiveSize = fontSize * scaleFactor;
    final double lowerLimit = fontSize * .9; // 90 % of font size
    final double upperLimit = fontSize * 1.5; // 150 % of font size
    final double result = responsiveSize.clamp(lowerLimit, upperLimit);
    return result;
  }

  static double _getScaleFactor() {
    switch (SizeManager.deviceType) {
      case DeviceTypeEnum.mobile:
        return SizeManager.screenWidth / (SizeManager.tabletBreakpoint * 0.65);
      case DeviceTypeEnum.tablet:
        return SizeManager.isPortrait
            ? SizeManager.screenWidth / (SizeManager.desktopBreakpoint * 0.6)
            : SizeManager.screenWidth / (SizeManager.desktopBreakpoint * 0.98);
    }
  }
}
