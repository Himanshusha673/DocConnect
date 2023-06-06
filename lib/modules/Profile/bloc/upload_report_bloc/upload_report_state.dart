part of 'upload_report_blocc.dart';

class UploaReportState {
  final FilePickerResult? ReportImage;
  const UploaReportState({this.ReportImage});
  UploaReportState copyWith({FilePickerResult? image}) {
    return UploaReportState(ReportImage: image);
  }
}
