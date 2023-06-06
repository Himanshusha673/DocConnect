part of 'upload_report_blocc.dart';

abstract class UploadReportEvent {}

class SelectUploadDocEvent extends UploadReportEvent {
  final FilePickerResult? repoerDoc;

  SelectUploadDocEvent({this.repoerDoc});
}
