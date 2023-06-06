part of 'forgot_password_bloc.dart';

class ForgotPasswordState {
  final String name;
  final String email;
  final FormSubmissionStatus formStatus;

  const ForgotPasswordState({this.name = "", this.email = "", this.formStatus = const InitialFormStatus()});
  ForgotPasswordState copyWith({
    String? name,
    String? email,
    FormSubmissionStatus? formStatus,
  }) {
    return ForgotPasswordState(
      name: name ?? this.name,
      email: email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String validationId;
  // final String otp;
  const ForgotPasswordSuccess({
    // required this.otp,
    required this.validationId,
  });
}
