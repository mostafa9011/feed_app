import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../../../core/utils/widgets/circular_image.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          const CircularImage(
            radius: 64,
            image: ConstantsManager.fakeImage,
          ),
          SizedBox(height: 16.h),
          const _customCardInfo(text: 'Mostafa '),
          const _customCardInfo(text: '@dev.com'),
        ],
      ),
    );
  }
}

class _customCardInfo extends StatelessWidget {
  final String text;

  const _customCardInfo({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      child: Text(
        text,
        style: TextStyles.medium16WBlack(context),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
