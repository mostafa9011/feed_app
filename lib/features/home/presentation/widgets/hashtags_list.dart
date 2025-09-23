import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_hashtag.dart';

class HashtagsList extends StatelessWidget {
  const HashtagsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CustomHashtag();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 12.w);
        },
      ),
    );
  }
}
