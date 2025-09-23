import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/routes/page_name.dart';
import '../../../../core/utils/dependency_injection/di.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../cubit/layout_cubit.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LayoutCubit>(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final cubit = context.read<LayoutCubit>();

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
                child: cubit.screens[state.currentIndex],
              ),
            ),
            floatingActionButton: state.currentIndex != 0
                ? null
                : FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageName.createPostScreen);
                    },
                    child: Icon(Icons.add, color: context.colorScheme.surface),
                  ),
            bottomNavigationBar: const CustomBottomNavBar(),
          );
        },
      ),
    );
  }
}
