part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final bool hasUnreadNotifications;
  final bool hasUnreadInboxItems;
  final bool hasUnreadAppointments;

  const HomeState({
    this.selectedIndex = 0,
    this.hasUnreadNotifications = false,
    this.hasUnreadInboxItems = true,
    this.hasUnreadAppointments = false,
  });

  @override
  List<Object?> get props => [
        selectedIndex,
        hasUnreadNotifications,
        hasUnreadAppointments,
        hasUnreadInboxItems,
      ];

  HomeState copyWith({
    int? selectedIndex,
    bool? hasUnreadNotifications,
    bool? hasUnreadInboxItems,
    bool? hasUnreadAppointments,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      hasUnreadNotifications:
          hasUnreadNotifications ?? this.hasUnreadNotifications,
      hasUnreadInboxItems: hasUnreadInboxItems ?? this.hasUnreadInboxItems,
      hasUnreadAppointments:
          hasUnreadAppointments ?? this.hasUnreadAppointments,
    );
  }
}
