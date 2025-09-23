import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/fields/text_field/custom_text_form_field.dart';
import '../../data/form_data/post_form_data.dart';
import 'custom_upload_image.dart';

class PostForm extends StatefulWidget {
  final PostFormData formData;
  const PostForm({required this.formData, super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formData.formKey,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          CustomTextFormField(
            hintText: 'Title',
            controller: widget.formData.titleController,
          ),
          SizedBox(height: 32.h),
          CustomTextFormField(
            hintText: 'Description',
            minLines: 4,
            controller: widget.formData.descriptionController,
          ),
          SizedBox(height: 32.h),

          // upload image
          CustomUploadImage(
            onSelectImage: (image) {
              widget.formData.imageFile = image;
            },
          ),
        ],
      ),
    );
  }
}
