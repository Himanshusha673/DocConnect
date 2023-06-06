part of 'prescription_details_bloc.dart';

abstract class PrescriptionDetailsBlocState extends Equatable {
  const PrescriptionDetailsBlocState();

  @override
  List<Object> get props => [];
}

abstract class PrescriptionDetailsActionBlocState
    extends PrescriptionDetailsBlocState {}

class PrescriptionDetailsBlocInitial extends PrescriptionDetailsBlocState {}

class PrescriptionDetailsBlocLoading extends PrescriptionDetailsBlocState {}

class PrescriptionDetailsBlocSuccess extends PrescriptionDetailsBlocState {
  final PrescriptionDetails? prescriptionDetails;
  const PrescriptionDetailsBlocSuccess(this.prescriptionDetails);
}

class PrescriptionDetailsBlocFailure extends PrescriptionDetailsBlocState {}

class PrescriptionDownloadBlocLoading
    extends PrescriptionDetailsActionBlocState {}

class PrescriptionDownlaodBlocFailure
    extends PrescriptionDetailsActionBlocState {}

class PrescriptionDownloadBlocSuccess
    extends PrescriptionDetailsActionBlocState {
  String prescriptionPdfurl;
  PrescriptionDownloadBlocSuccess({required this.prescriptionPdfurl});
}
