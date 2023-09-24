part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool hasUnreadNotifications;
  final bool hasUnreadInboxItems;
  final bool hasUnreadAppointments;

  const HomeState({
    this.hasUnreadNotifications = false,
    this.hasUnreadInboxItems = true,
    this.hasUnreadAppointments = false,
  });

  @override
  List<Object?> get props => [
        hasUnreadNotifications,
        hasUnreadAppointments,
        hasUnreadInboxItems,
      ];
}
