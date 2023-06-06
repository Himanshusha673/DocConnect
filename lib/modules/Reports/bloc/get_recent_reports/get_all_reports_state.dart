part of 'get_all_reports_bloc.dart';

abstract class GetAllReportsState extends Equatable {
  const GetAllReportsState();

  @override
  List<Object> get props => [];
}

class GetAllReportsInitial extends GetAllReportsState {}

class GetAllReportsLoading extends GetAllReportsState {}

class GetAllReportsSuccess extends GetAllReportsState {
  final GetAllRecentReportsResponse response;
  const GetAllReportsSuccess({required this.response});
}

class GetAllReportsFailure extends GetAllReportsState {}
