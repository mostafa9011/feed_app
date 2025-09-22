import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import 'custom_favorite_button.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({super.key});

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
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                'https://picsum.photos/seed/1/600/400',
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),

        Text(
          'Morning hike',
          style: TextStyles.boldW18Black(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4.h),
        Text(
          'Enjoying the fresh air and stunning views on my morning hike. Nature is the best therapy!',
          style: TextStyles.regular14Secondary(context),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 22.h),

        // favorite button
        const CustomFavoriteButton(),
        SizedBox(height: 32.h),
      ],
    );
  }
}
