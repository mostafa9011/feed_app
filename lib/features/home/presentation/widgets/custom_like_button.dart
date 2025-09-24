import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../data/models/post_model.dart';
import '../cubit/home_cubit.dart';

class CustomLikeButton extends StatefulWidget {
  final PostModel post;
  const CustomLikeButton({required this.post, super.key});

  @override
  State<CustomLikeButton> createState() => _CustomLikeButtonState();
}

class _CustomLikeButtonState extends State<CustomLikeButton> {
  late List<String> specificLikes;

  @override
  void initState() {
    specificLikes = widget.post.likes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // rollback if steate is failure
        if (state.isToggleLikeFailure) {
          setState(() {
            specificLikes = widget.post.likes;
          });
        }
      },
      builder: (context, state) {
        final userId = FirebaseAuth.instance.currentUser!.uid;

        return Row(
          children: [
            FavoriteButton(
              isFavorite: specificLikes.contains(userId),
              valueChanged: (value) {
                setState(() {
                  if (value) {
                    specificLikes.add(userId);
                  } else {
                    specificLikes.remove(userId);
                  }
                });

                context.read<HomeCubit>().toggleLike(
                      postId: widget.post.id!,
                      userId: userId,
                    );
              },
              iconSize: 44,
            ),
            SizedBox(width: 4.w),
            Text(
              specificLikes.length.toString(),
              style: TextStyles.boldW16Black(context).copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        );
      },
    );
  }
}
