import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit.dart';
import '../widgets/custom_home_app_bar.dart';
import '../widgets/posts_list.dart';
import '../widgets/suggested_users.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return RefreshIndicator(
      onRefresh: () async {
        homeCubit.getPosts();
        homeCubit.getSuggestedUsers();
      },
      child: CustomScrollView(
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
      ),
    );
  }
}
