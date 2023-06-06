import 'dart:developer';

import 'package:doc_connect/modules/Auth/model/forgot_password/forgot_password_request_model.dart';
import 'package:doc_connect/modules/Auth/model/forgot_password/forgot_password_response.dart';
import 'package:doc_connect/modules/Auth/model/forgot_password/verify_forgot_password_request.dart';
import 'package:doc_connect/modules/Auth/model/forgot_password/verify_forgot_password_response.dart';
import 'package:doc_connect/modules/Auth/model/login/login_phone_request_model.dart';
import 'package:doc_connect/modules/Auth/model/login/login_request_model.dart';
import 'package:doc_connect/modules/Auth/model/login/login_response_model.dart';
import 'package:doc_connect/modules/Auth/model/register/register_response_model.dart';
import 'package:doc_connect/utils/SharePref.dart';
import 'package:doc_connect/utils/constants/api_konstants.dart';

import '../../../common_components/services/api_requests.dart';
import '../model/login/login_phone_response_model.dart';
import '../model/login/mfa_phone_request.dart';
import '../model/login/patient_fromuid_response.dart';
import '../model/register/register_request_model.dart';
import '../model/register/verify_register_request_model.dart';
import '../model/register/verify_register_response_model.dart';

import 'package:http/http.dart' as http;

class AuthRepository {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': '<Your token>'
  };
  //register user
  Future<Response<RegisterResponse>?> register(
      {required RegisterRequest registerRequest}) async {
    Response<RegisterResponse>? response =
        await ApiRequest<RegisterRequest, RegisterResponse>().post(
      url: ApiConstants.register,
      reponseFromJson: registerResponseFromJson,
      request: registerRequest,
      requestToJson: registerRequestToJson,
    );
    return response;
  }

  //register user
  Future<Response<VerifyRegisterResponse>> registerVerify(
      {required VerifyRegisterRequest verifyRegisterRequest}) async {
    Response<VerifyRegisterResponse> response =
        await ApiRequest<VerifyRegisterRequest, VerifyRegisterResponse>().post(
      url: ApiConstants.registerVerify,
      reponseFromJson: verifyRegisterResponseFromJson,
      request: verifyRegisterRequest,
      requestToJson: verifyRegisterRequestToJson,
    );
    return response;
  }

  //login with emmail password
  Future<Response<LoginResponseModel>?> login(
      {required LoginRequestModel loginRequest}) async {
    Response<LoginResponseModel>? response =
        await ApiRequest<LoginRequestModel, LoginResponseModel>().post(
      url: ApiConstants.login,
      reponseFromJson: loginResponseModelFromJson,
      request: loginRequest,
      requestToJson: loginRequestModelToJson,
    );
    if (response.response != null) {
      sharedPrefs.setAuthToken(response.response!.data.authToken);
      sharedPrefs.setName(response.response!.data.user.name);
      sharedPrefs.setId(response.response!.data.user.id);
      print(response.response!.data.user.id);
      print(sharedPrefs.id);
      sharedPrefs.setPatientId(response.response!.data.user.patient.id);
      if (response.response!.data.user.patient.patientCategory.isNotEmpty) {
        sharedPrefs.setPatientClinicId(
            response.response!.data.user.patient.patientCategory[0].clinicId);
      }
      sharedPrefs.setEmailId(response.response!.data.user.email);
    }

    return response;
  }

  //login with phone otp
  Future<Response<LoginPhoneResponse>> loginPhone(
      {required LoginPhoneRequestModel loginPhoneRequestModel}) async {
    Response<LoginPhoneResponse> responseModel =
        await ApiRequest<LoginPhoneRequestModel, LoginPhoneResponse>().post(
      url: ApiConstants.loginPhone,
      reponseFromJson: loginPhoneResponseFromJson,
      request: loginPhoneRequestModel,
      requestToJson: loginPhoneRequestModelToJson,
    );
    log('requestModel.request!.phone ${loginPhoneRequestModel.phoneNumber}');

    log('responseModel.response!.data.authToken ${responseModel.response?.data}');

    return responseModel;
  }

  //verify phone mfa
  //verify mfa
  Future<Response<LoginResponseModel>?> mfaPhone(
      {required MfaPhoneRequest mfaPhoneRequest}) async {
    Response<LoginResponseModel> res =
        await ApiRequest<MfaPhoneRequest, LoginResponseModel>().post(
      url: ApiConstants.loginPhoneMfa,
      reponseFromJson: loginResponseModelFromJson,
      request: mfaPhoneRequest,
      requestToJson: mfaPhoneRequestToJson,
    );

    if (res.response != null) {
      log('responseModel.response!.data.authToken ${res.response?.data}');
      sharedPrefs.setAuthToken(res.response!.data.authToken);
      sharedPrefs.setName(res.response!.data.user.name);
      sharedPrefs.setId(res.response!.data.user.id);
      sharedPrefs.setPatientId(res.response!.data.user.patient.id);
      if (res.response!.data.user.patient.patientCategory.isNotEmpty) {
        sharedPrefs.setPatientClinicId(
            res.response!.data.user.patient.patientCategory[0].clinicId);
      }
      sharedPrefs.setEmailId(res.response!.data.user.email);

      // Note Api Response has chnaged and please set this
      // sharedPrefs.setPatientId(response?.data.patient.id ?? '');
    }

    return res;
  }

  //forgot password
  Future<Response<ForgotPasswordResponse>?> forgotPassword(
      {required ForgotPasswordRequest forgotPasswordRequest}) async {
    Response<ForgotPasswordResponse>? response =
        await ApiRequest<ForgotPasswordRequest, ForgotPasswordResponse>().post(
      url: ApiConstants.forgotPassword,
      reponseFromJson: forgotPasswordResponseFromJson,
      request: forgotPasswordRequest,
      requestToJson: forgotPasswordRequestToJson,
    );
    return response;
  }

  //verify forgot password
  Future<Response<VerifyForgotPasswordResponse>?> verifyForgotPassword(
      {required VerifyForgotPasswordRequest
          verifyForgotPasswordRequest}) async {
    Response<VerifyForgotPasswordResponse>? response = await ApiRequest<
            VerifyForgotPasswordRequest, VerifyForgotPasswordResponse>()
        .post(
      url: ApiConstants.verifyForgotPassword,
      reponseFromJson: verifyPasswordResponseFromJson,
      request: verifyForgotPasswordRequest,
      requestToJson: verifyPasswordRequestToJson,
    );
    return response;
  }

  //get patient detail from userid
  Future<PatientFromUserIdResponse?> getPatientDetails() async {
    PatientFromUserIdResponse? response =
        await ApiRequest<String, PatientFromUserIdResponse>().get(
      url: "${ApiConstants.getPatientByuid}/${sharedPrefs.id}",
      reponseFromJson: patientFromUserIdResponseFromJson,
    );

    // sharedPrefs.setPatientId(response?.data.patient.id ?? '');
    return response;
  }

  // Social Media Login
  Future<bool> socialMediaLogin({required String url}) async {
    var uri = Uri.parse(url);
    log("ApiRequest GET : $uri");
    var response = await http.get(
      uri,
      headers: requestHeaders,
    );
    log("ApiRequest Response ${response.statusCode} : ${response.body}");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
