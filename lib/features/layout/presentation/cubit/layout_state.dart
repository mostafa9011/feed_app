part of 'layout_cubit.dart';

enum LayoutStatus {
  initial,
  changeIndexState,
}

@immutable
class LayoutState {
  final LayoutStatus status;
  final int currentIndex;

  const LayoutState({
    required this.status,
    this.currentIndex = 0,
  });

  LayoutState copyWith({
    required LayoutStatus status,
    int? currentIndex,
  }) {
    return LayoutState(
      status: status,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
