part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {
  const NotificationInitial();
}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  int page;
  bool isRead;
  List<NotificationModelData> loadedData;
  NotificationSuccess({
    required this.isRead,
    required this.loadedData,
    required this.page,
  });
}

class NotificationFailureSttae extends NotificationState {
  int page;
  bool isRead;
  final List<NotificationModelData> loadedData;
  NotificationFailureSttae({
    required this.isRead,
    required this.loadedData,
    required this.page,
  });
}
