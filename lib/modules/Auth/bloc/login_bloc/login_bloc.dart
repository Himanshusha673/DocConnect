import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/common_components/services/form_submission_status.dart';
import 'package:jatya_patient_mobile/modules/Auth/model/login/login_response_model.dart';
import 'package:jatya_patient_mobile/modules/Auth/model/login/patient_fromuid_response.dart';
import '../../../../common_components/services/api_requests.dart';
import '../../model/login/login_request_model.dart';
import '../../services/auth_repository.dart';
import 'package:equatable/equatable.dart';
part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  LoginBloc(this._authRepository) : super(LoginState()) {
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<LoginREInitital>((event, emit) {
      emit(state.copyWith(formStatus: const InitialFormStatus()));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        Response<LoginResponseModel>? res = await _authRepository.login(
          loginRequest: LoginRequestModel(
            email: state.email,
            password: state.password,
          ),
        );
        if (res!.response == null) {
          emit(state.copyWith(
              formStatus: FormSubmissionFailed(res.error ?? "Login Failed")));
        } else {
          PatientFromUserIdResponse? res1 =
              await _authRepository.getPatientDetails();
          emit(LoginSuccess(res));
          // emit(state.copyWith(formStatus: FormSubmissionSuccess()));
          // if (res.response!.data.roles.contains("Patient")) {
          // } else {
          //   emit(LoginRoleFailed());
          // }
        }
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(formStatus: FormSubmissionFailed(e.toString())));
      }
    });
  }
}
