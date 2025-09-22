import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/dependency_injection/di.dart';
import '../cubit/layout_cubit.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LayoutCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<LayoutCubit, LayoutState>(
            builder: (context, state) {
              final cubit = context.read<LayoutCubit>();

              return cubit.screens[state.currentIndex];
            },
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
