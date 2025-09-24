import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../data/models/post_model.dart';
import '../cubit/home_cubit.dart';
import 'custom_post.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current.status == HomeStatus.getPostsLoading ||
            current.status == HomeStatus.getPostsSuccess ||
            current.status == HomeStatus.getPostsFailure ||
            current.status == HomeStatus.createPostSuccess;
      },
      builder: (context, state) {
        // empty state
        if (state.posts?.isEmpty ?? false) {
          return SliverToBoxAdapter(
            child: Text(
              "No posts yet",
              style: TextStyles.boldW18Black(context),
              textAlign: TextAlign.center,
            ),
          );
        }

        // error state
        if (state.isGetPostsFailure) {
          return SliverToBoxAdapter(
            child: Text(
              state.errorMessage!,
              style: TextStyles.regular14Secondary(context).copyWith(
                color: context.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        // success state
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: state.posts?.length ?? 2,
            (context, index) {
              return Skeletonizer(
                enabled: state.isGetPostsLoading,
                child: FadeInUp(
                  child: CustomPost(
                    key: Key(state.posts?[index].id ?? index.toString()),
                    post: state.posts?[index] ?? PostModel.dummy(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
