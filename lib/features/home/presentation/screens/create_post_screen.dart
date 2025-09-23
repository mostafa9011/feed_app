import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../data/form_data/post_form_data.dart';
import '../widgets/hashtags_list.dart';
import '../widgets/post_form.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr.createPost,
          style: TextStyles.boldW18Black(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).r,

        // post form
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32).r,
        child: CustomElevatedButton(
          onPressed: () {
            if (!formData.formKey.currentState!.validate()) return;
          },
          text: context.tr.publish,
        ),
      ),
    );
  }
}
