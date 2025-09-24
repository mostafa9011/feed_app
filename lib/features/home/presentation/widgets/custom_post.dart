import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../data/models/post_model.dart';
import 'custom_favorite_button.dart';

class CustomPost extends StatelessWidget {
  final PostModel post;
  const CustomPost({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // image
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(post.imageUrl),
            ),
          ),
        ),
        SizedBox(height: 16.h),

        Text(
          post.title,
          style: TextStyles.boldW18Black(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4.h),
        Text(
          post.description,
          style: TextStyles.regular14Secondary(context),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 22.h),

        // favorite button
        CustomFavoriteButton(likes: post.likes),
        SizedBox(height: 32.h),
      ],
    );
  }
}
