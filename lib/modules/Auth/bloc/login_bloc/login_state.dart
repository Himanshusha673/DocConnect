part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;

  final FormSubmissionStatus formStatus;
  LoginState({
    this.email = "",
    this.password = "",
    this.formStatus = const InitialFormStatus(),
  });
  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class LoginInitial extends LoginState {}

class LoginFailed extends LoginState {}

class LoginSuccess extends LoginState {
  Response<LoginResponseModel> response;
  LoginSuccess(this.response);
}

class LoginRoleFailed extends LoginState {}
