import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../data/form_data/post_form_data.dart';
import '../cubit/home_cubit.dart';
import '../widgets/create_post_button.dart';
import '../widgets/hashtags_list.dart';
import '../widgets/post_form.dart';

class CreatePostScreen extends StatefulWidget {
  final HomeCubit cubit;
  const CreatePostScreen({required this.cubit, super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final formData = PostFormData();

  @override
  void dispose() {
    formData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.tr.createPost,
            style: TextStyles.boldW18Black(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).r,

          // post form
          child: SingleChildScrollView(
            child: Column(
              children: [
                // post form
                PostForm(
                  formData: formData,
                ),
                SizedBox(height: 32.h),

                // hashtags
                const HashtagsList(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32).r,

          // create post button
          child: CreatePostButton(
            formData: formData,
          ),
        ),
      ),
    );
  }
}
