import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/screens/home_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(const LayoutState(status: LayoutStatus.initial));

  final List<Widget> screens = [
    const HomeScreen(),
    const Center(child: Text('Friends')),
    const Center(child: Text('Notifications')),
    const Center(child: Text('Profile')),
  ];

  void changeIndex(int index) {
    emit(
      state.copyWith(
        status: LayoutStatus.changeIndexState,
        currentIndex: index,
      ),
    );
  }
}
