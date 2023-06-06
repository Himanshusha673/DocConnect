part of 'register_bloc.dart';

class RegisterState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confpassword;
  // bool get isValidemail => email.length > 8; //TODO
  // bool get isValidPassword => password.length > 8; //TODO
  final FormSubmissionStatus formStatus;
  RegisterState({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
    this.confpassword = "",
    this.formStatus = const InitialFormStatus(),
  });
  RegisterState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confpassword,
    FormSubmissionStatus? formStatus,
  }) {
    return RegisterState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confpassword: confpassword ?? this.confpassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String validationId;
  final String otp;
  RegisterSuccess({required this.otp, required this.validationId});
}
