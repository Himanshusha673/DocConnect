import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:jatya_patient_mobile/modules/MyJatya/models/cancel_appointment_model.dart';
import 'package:jatya_patient_mobile/modules/MyJatya/models/upcoming_appointment_model.dart';
import 'package:jatya_patient_mobile/utils/constants/api_konstants.dart';
import 'package:http/http.dart' as http;

class AppointmentRepo {
  // get all Appointments
  static Future<GetAllAppointmentsResponse?> fetchAllAppointments(
      String patientId, String authToken, bool patientDoctorData) async {
    var url = ApiConstants.getAllAppointments;
    log(patientId);

    Uri uri = Uri.parse(
        "$url&patientId=$patientId&status=PENDING&patient_doctor_data=$patientDoctorData");
    try {
      http.Response response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',
      });

      log(response.body);
      log("Got response");
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        GetAllAppointmentsResponse getAllAppointments =
            GetAllAppointmentsResponse.fromJson(jsonDecode(response.body));
        // List<NotificationModelData> dataModel = notificationResponse.data!;
        return getAllAppointments;
      } else {
        return null;
        // throw Exception('Failed to fetch notifications');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e);
    }
  }

  ////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
  ///
  // cancel Appointments
  static Future<CancelAppointmentResponse?> cancelAppointment(
    String appointmentId,
    String authToken,
  ) async {
    log("this is $appointmentId");
    Map<String, dynamic> data = {"status": "CANCELLED"};
    var url = ApiConstants.cancelAppointments;

    Uri uri = Uri.parse("$url$appointmentId");
    print(uri);
    try {
      http.Response response =
          await http.put(uri, body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',
      });

      log(response.body);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        CancelAppointmentResponse cancelResponse =
            CancelAppointmentResponse.fromJson(jsonDecode(response.body));
        // List<NotificationModelData> dataModel = notificationResponse.data!;
        return cancelResponse;
      } else {
        return null;
        // throw Exception('Failed to fetch notifications');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e);
    }
  }
}
