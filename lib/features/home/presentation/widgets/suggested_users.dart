import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import 'custom_user_card.dart';

class SuggestedUsers extends StatelessWidget {
  const SuggestedUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggested',
            style: TextStyles.boldW18Black(context),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            height: 200.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CustomUserCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 32.w);
              },
            ),
          ),
        ],
      ),
    );
  }
}
