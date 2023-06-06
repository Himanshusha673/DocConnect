import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _sharedPref;
  init() async {
    _sharedPref ??= await SharedPreferences.getInstance();
    //print(_sharedPref!.getString("userId"));
  }

  bool? get onboarded => _sharedPref!.getBool("onboarded") ?? false;
  String? get authToken => _sharedPref!.getString("authToken") ?? "";
  String? get name => _sharedPref!.getString("name") ?? "";
  String? get id => _sharedPref!.getString("id") ?? "";
  String? get patientId => _sharedPref!.getString("patientId") ?? "";
  String? get patientClinicId =>
      _sharedPref!.getString("patientClinicId") ?? "";
  String? get emailId => _sharedPref!.getString("emailId") ?? "";
  String? get appointmentId => _sharedPref!.getString("appointmentId") ?? "";

  setLogout() {
    _sharedPref!.setString("authToken", '');
    _sharedPref!.setString("name", '');
    _sharedPref!.setString("id", '');
    _sharedPref!.setString("patientId", '');
    _sharedPref!.setString("patientClinicId", '');
    _sharedPref!.setString("emailId", '');
    _sharedPref!.setString("appointmentId", '');
  }

  //setters
  setAuthToken(String authToken) {
    _sharedPref!.setString("authToken", authToken);
  }

  setUserId(String userId) {
    _sharedPref!.setString("userId", userId);
  }

  setName(String name) {
    _sharedPref!.setString("name", name);
  }

  setId(String id) {
    _sharedPref!.setString("id", id);
  }

  setOnboarded() {
    _sharedPref!.setBool("onboarded", true);
  }

  setPatientId(String patientId) {
    log("setting patient ID");
    log("patient Id is $patientId");
    _sharedPref!.setString("patientId", patientId);
  }

  setPatientClinicId(String patientClinicId) {
    _sharedPref!.setString("patientClinicId", patientClinicId);
  }

  setAppointmentId(String appointmentId) {
    _sharedPref!.setString("appointmentId", appointmentId);
  }

  setEmailId(String emailId) {
    _sharedPref!.setString("emailId", emailId);
  }
}

final sharedPrefs = SharedPref();
