import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/config/themes/text_styles.dart';
import '../../../../core/helpers/image_picker_helper.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/widgets/custom_dotter_border.dart';

class CustomUploadImage extends StatefulWidget {
  final Function(XFile?)? onSelectImage;

  const CustomUploadImage({super.key, this.onSelectImage});

  @override
  State<CustomUploadImage> createState() => _CustomUploadImageState();
}

class _CustomUploadImageState extends State<CustomUploadImage> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return FormField<XFile>(
      validator: (value) {
        if (value == null) {
          return context.tr.fieldRequired;
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDottedBorder(
              color: field.hasError
                  ? context.colorScheme.error
                  : context.colorScheme.secondary,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    // if image is selected
                    if (image != null)
                      Row(
                        children: [
                          const Spacer(),
                          Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                            height: 130.h,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() => image = null);
                              field.didChange(null);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: context.colorScheme.error,
                            ),
                          ),
                        ],
                      )
                    else ...[
                      Text(
                        "Upload Image",
                        style: TextStyles.boldW18Black(context),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Select an image from your device",
                        style: TextStyles.regular14Secondary(context).copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      ElevatedButton(
                        onPressed: () async {
                          final picked =
                              await ImagePickerHelper.pickFromGallery();
                          if (picked != null && widget.onSelectImage != null) {
                            setState(() {
                              widget.onSelectImage!(picked);
                              image = picked;
                              field.didChange(image);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.colorScheme.onSecondary,
                        ),
                        child: Text(
                          'Upload',
                          style: TextStyles.boldW16Black(context),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // 👇 validator has detected an error
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  field.errorText ?? '',
                  style: TextStyles.regular14Secondary(context).copyWith(
                    color: context.colorScheme.error,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
