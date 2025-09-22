import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_home_app_bar.dart';
import '../widgets/posts_list.dart';
import '../widgets/suggested_users.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // app bar
        const CustomHomeAppBar(),

        SliverToBoxAdapter(child: SizedBox(height: 16.h)),

        // suggested users
        const SuggestedUsers(),
        SliverToBoxAdapter(child: SizedBox(height: 32.h)),

        // posts
        const PostsList(),
      ],
    );
  }
}
