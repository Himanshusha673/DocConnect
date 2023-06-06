import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:doc_connect/common_components/services/form_submission_status.dart';
import 'package:doc_connect/modules/Auth/model/forgot_password/forgot_password_request_model.dart';
import 'package:doc_connect/modules/Auth/model/forgot_password/forgot_password_response.dart';
import 'package:doc_connect/modules/Auth/services/auth_repository.dart';

import '../../../../common_components/services/api_requests.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository authRepository;
  ForgotPasswordBloc({required this.authRepository})
      : super(ForgotPasswordInitial()) {
    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<ForgotPasswordReinital>((event, emit) {
      emit(state.copyWith(formStatus: const InitialFormStatus()));
    });
    on<ForgotPasswordSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        Response<ForgotPasswordResponse>? res =
            await authRepository.forgotPassword(
          forgotPasswordRequest: ForgotPasswordRequest(
            name: "Test Name",
            email: state.email,
          ),
        );
        res?.response == null
            ? emit(state.copyWith(
                formStatus: FormSubmissionFailed("Request Failed")))
            : emit(ForgotPasswordSuccess(
                // otp: res.response!.data.otp,
                validationId: res!.response!.data.validationId));
      } catch (e) {
        emit(state.copyWith(formStatus: FormSubmissionFailed(e.toString())));
      }
    });
  }
}
