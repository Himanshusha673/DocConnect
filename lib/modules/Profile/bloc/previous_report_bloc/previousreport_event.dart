part of 'previousreport_bloc.dart';

abstract class PreviousReportEvent extends Equatable {
  const PreviousReportEvent();
  @override
  List<Object> get props => [];
}

class PreviousReportInitialEvent extends PreviousReportEvent {
  const PreviousReportInitialEvent();
}

class PreviousReportGetReportsEvent extends PreviousReportEvent {
  const PreviousReportGetReportsEvent();
}

class PreviousReportNameChangedEvent extends PreviousReportEvent {
  final DropDownItem reportName;
  const PreviousReportNameChangedEvent({required this.reportName});
}

class PreviousReportDateChangedEvent extends PreviousReportEvent {
  final String date;
  const PreviousReportDateChangedEvent({required this.date});
}

class PreviousReportUploadReportEvent extends PreviousReportEvent {
  final File file;
  const PreviousReportUploadReportEvent({required this.file});
}

class PreviousReportLoadingEvent extends PreviousReportEvent {
  const PreviousReportLoadingEvent();
}
