part of 'get_all_reports_bloc.dart';

abstract class GetAllReportsEvent extends Equatable {
  const GetAllReportsEvent();

  @override
  List<Object> get props => [];
}

class GetAllRecentReportsEvent extends GetAllReportsEvent {}
