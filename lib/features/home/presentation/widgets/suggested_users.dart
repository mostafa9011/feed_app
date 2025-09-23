import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../domain/entities/suggested_user_entity.dart';
import '../cubit/home_cubit.dart';
import 'custom_user_card.dart';

class SuggestedUsers extends StatelessWidget {
  const SuggestedUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current.status == HomeStatus.getSuggestedUsersSuccess ||
            current.status == HomeStatus.getSuggestedUsersFailure ||
            current.status == HomeStatus.getSuggestedUsersLoading;
      },
      builder: (context, state) {
        // empty state
        if (state.suggestedUsers?.isEmpty ?? false) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr.suggested,
                style: TextStyles.boldW18Black(context),
              ),
              SizedBox(height: 32.h),

              // error state
              if (state.status == HomeStatus.getSuggestedUsersFailure) ...[
                Text(
                  state.errorMessage!,
                  style: TextStyles.regular14Secondary(context).copyWith(
                    color: context.colorScheme.error,
                  ),
                ),
              ]

              // suggested users
              else ...[
                Skeletonizer(
                  enabled: state.isGetSuggestedUsersLoading,
                  child: SizedBox(
                    height: 200.h,
                    child: FadeInRight(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.suggestedUsers?.length ?? 2,
                        itemBuilder: (context, index) {
                          final user = state.suggestedUsers?[index];

                          // fake data for loading state
                          if (user == null) {
                            return CustomUserCard(
                              user: SuggestedUserEntity.dummy(),
                            );
                          }

                          return CustomUserCard(user: user);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 32.w);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
