part of 'previousreport_bloc.dart';

class PreviousReportState {
  final List<ReportDatum> reports;
  final DropDownItem? reportName;
  final String? date;
  final List<DropDownItem> reportOptions = const [
    DropDownItem(name: 'Blood Test'),
    DropDownItem(name: 'Urine Test'),
    DropDownItem(name: 'Eye Test'),
  ];
  const PreviousReportState({this.reportName, this.date, this.reports = const []});

  PreviousReportState copyWith({
    DropDownItem? reportName,
    String? date,
    List<ReportDatum>? reports,
  }) {
    return PreviousReportState(
      reportName: reportName ?? this.reportName,
      date: date ?? this.date,
      reports: reports ?? this.reports,
    );
  }
}

class PreviousReportLoadingState extends PreviousReportState {}

class PreviousReportInitialState extends PreviousReportState {}

class PreviousReportUploadedState extends PreviousReportState {}
