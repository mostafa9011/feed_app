import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';

class CustomFavoriteButton extends StatelessWidget {
  final List<String> likes;
  const CustomFavoriteButton({required this.likes, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FavoriteButton(
          valueChanged: (value) {},
          iconSize: 44,
        ),
        SizedBox(width: 4.w),
        Text(
          likes.length.toString(),
          style: TextStyles.boldW16Black(context).copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
