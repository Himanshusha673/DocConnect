part of 'mediline_search_bloc.dart';

abstract class MedilineSearchEvent extends Equatable {
  const MedilineSearchEvent();
  @override
  List<Object> get props => [];
}

class MedilineGetSearchEvent extends MedilineSearchEvent {
  final String searchQuery;
  const MedilineGetSearchEvent({
    required this.searchQuery,
  });
}
