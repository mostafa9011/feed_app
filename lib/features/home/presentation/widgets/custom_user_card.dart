import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/widgets/circular_image.dart';
import '../../domain/entities/suggested_user_entity.dart';

class CustomUserCard extends StatelessWidget {
  final SuggestedUserEntity user;

  const CustomUserCard({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          CircularImage(
            radius: 64,
            image: user.image,
          ),
          SizedBox(height: 16.h),
          _customCardInfo(text: user.name),
          _customCardInfo(text: user.username),
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
