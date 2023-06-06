import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:doc_connect/modules/Reports/models/get_recent_report_response_model.dart';
import 'package:doc_connect/utils/constants/api_konstants.dart';

class RecentReportsRepository {
  ///////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  // get all recent Reports
  static Future<GetAllRecentReportsResponse>
      fetchAllRecentreportsforSpecPatient(
          String? patientId, String? token) async {
    GetAllRecentReportsResponse model;
    var response = await http
        .get(Uri.parse("${ApiConstants.getPrevReport}/$patientId"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      try {
        model = GetAllRecentReportsResponse.fromJson(jsonDecode(response.body));
        log(model.message.toString());

        return model;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        throw Exception(e.toString());
      }
      // print(response.body.toString());
    } else {
      if (kDebugMode) {
        print("Exception while Fetching recent reports");
      }
      throw Exception(response.reasonPhrase);
    }
  }
}
