import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';
import '../../../../core/utils/widgets/show_toast.dart';
import '../../data/form_data/post_form_data.dart';
import '../cubit/home_cubit.dart';

class CreatePostButton extends StatelessWidget {
  final PostFormData formData;
  const CreatePostButton({required this.formData, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // success state
        if (state.isCreatePostSuccess) {
          Navigator.pop(context);
          showToast(
            context: context,
            type: ToastType.success,
            message: "Post Created Successfully",
          );
        }
        // error state
        else if (state.isCreatePostFailure) {
          showToast(
            context: context,
            type: ToastType.error,
            message: state.errorMessage!,
          );
        }
      },
      buildWhen: (previous, current) {
        return current.status == HomeStatus.createPostLoading ||
            current.status == HomeStatus.createPostSuccess ||
            current.status == HomeStatus.createPostFailure;
      },
      builder: (context, state) {
        return CustomElevatedButton(
          isLoading: state.isCreatePostLoading,
          onPressed: () async {
            if (!formData.formKey.currentState!.validate()) return;

            await context.read<HomeCubit>().createPost(formData: formData);
          },
          text: context.tr.publish,
        );
      },
    );
  }
}
