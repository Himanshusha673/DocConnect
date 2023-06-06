import 'package:jatya_patient_mobile/common_components/services/api_requests.dart';
import 'package:jatya_patient_mobile/modules/Auth/model/login/login_response_model.dart';

import '../../../../common_components/services/form_submission_status.dart';

class LoginPhoneState {
  final String phoneNumber;
  final String countryCode;
  final FormSubmissionStatus formStatus;
  const LoginPhoneState({
    this.phoneNumber = '',
    this.countryCode = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginPhoneState copyWith({String? phoneNumber, String? countryCode, FormSubmissionStatus? formStatus}) {
    return LoginPhoneState(
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object> get props => [];
}

class LoginPhoneInitial extends LoginPhoneState {}

class LoginPhoneSuccess extends LoginPhoneState {
  String otp;
  String validationId;
  LoginPhoneSuccess({
    required this.otp,
    required this.validationId,
  });
}

class LoginPhoneFailure extends LoginPhoneState {
  final String error;
  LoginPhoneFailure({required this.error});
}


class LoginPhoneOTPFailure extends LoginPhoneState {
  final String error;
  LoginPhoneOTPFailure({required this.error});
}

class LoginPhoneOTPSuccess extends LoginPhoneState {
  LoginResponseModel response;
  LoginPhoneOTPSuccess(this.response);
}