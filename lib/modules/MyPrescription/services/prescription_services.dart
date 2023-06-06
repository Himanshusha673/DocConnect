import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/models/download_prescription/download_prescription_details.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/models/latest_prescription.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/models/prescription_deatils/prescription_details.dart';
import 'package:jatya_patient_mobile/utils/constants/api_konstants.dart';
import 'package:http/http.dart' as http;

class PrescriptionRepo {
  // get all Prescriptions
  static Future<GetAllPrecriptionResposnse?> fetchAllPrescriptions(
    String patientId,
    String authToken,
  ) async {
    var url = ApiConstants.getAllPresciriptions;
    Uri uri = Uri.parse("$url&patientId=$patientId");
    try {
      http.Response response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',
      });

      log(response.body);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        GetAllPrecriptionResposnse getAllPrescriptions =
            GetAllPrecriptionResposnse.fromJson(jsonDecode(response.body));
        // List<NotificationModelData> dataModel = notificationResponse.data!;
        return getAllPrescriptions;
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

  // get all Prescriptions
  static Future<PrescriptionDetails?>
      fetchSpecificPrescriptionsDetailsByAppointmentID(
    String appointmentId,
    String authToken,
  ) async {
    var url = ApiConstants.getSpecificAppointments;
    Uri uri = Uri.parse(
        "$url$appointmentId?patient_doctor_data=true&clinicData=true");
    try {
      http.Response response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',
      });

      log(response.body);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        PrescriptionDetails prescriptionDetails =
            PrescriptionDetails.fromJson(jsonDecode(response.body));

        return prescriptionDetails;
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

  static Future<DownloadPrescriptionDetails?> downloadPrescriptionPdf(
    String prescriptionId,
    String authToken,
  ) async {
    var url = ApiConstants.downloadPrescription;
    Uri uri = Uri.parse("$url$prescriptionId");
    try {
      http.Response response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',
      });

      log(response.body);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        DownloadPrescriptionDetails prescriptionDetails =
            DownloadPrescriptionDetails.fromJson(jsonDecode(response.body));

        return prescriptionDetails;
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
