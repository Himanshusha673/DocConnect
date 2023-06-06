part of 'login_phone_bloc.dart';

class LoginPhoneEvent extends Equatable {
  const LoginPhoneEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneNumberChanged extends LoginPhoneEvent {
  final String phoneNumber;
  const LoginPhoneNumberChanged({required this.phoneNumber});
}

class LoginCountryCodeChanged extends LoginPhoneEvent {
  final String countryCode;
  const LoginCountryCodeChanged({required this.countryCode});
}

class LoginPhoneSubmitted extends LoginPhoneEvent {
  const LoginPhoneSubmitted();
}

class LoginPhoneReinitial extends LoginPhoneEvent {
  const LoginPhoneReinitial();
}

class LoginPhoneOTPSubmitted extends LoginPhoneEvent {
  final String otp;
  final String validationId;
  const LoginPhoneOTPSubmitted({required this.otp, required this.validationId});
}

class LoginPhoneOTPResend extends LoginPhoneEvent {
  final String validationId;
  const LoginPhoneOTPResend({required this.validationId});
}

class LoginPhoneOTPFailure extends LoginPhoneEvent {
  final String error;
  const LoginPhoneOTPFailure(
    this.error,
  );
}


