part of 'bottom_nav_bar_cubit.dart';

sealed class BottomNavBarState extends Equatable {
  final int selectedIndex;
  const BottomNavBarState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

final class BottomNavBarInitial extends BottomNavBarState {
  const BottomNavBarInitial(super.selectedIndex);
}
