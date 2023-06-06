import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:doc_connect/modules/Profile/models/prev_reports/post_report_request.dart';
import 'package:doc_connect/modules/Profile/models/prev_reports/post_report_response.dart';

import '../../../common_components/services/api_requests.dart';
import '../../../utils/SharePref.dart';
import '../../../utils/constants/api_konstants.dart';
import 'package:http/http.dart' as http;

import '../models/prev_reports/get_previous_reports_response.dart';

class PreviousReportRepository {
  //get reports
  Future<GetPreviousReportsResponse?> getReports() async {
    GetPreviousReportsResponse? response =
        await ApiRequest<String, GetPreviousReportsResponse>().get(
      url: ApiConstants.prevReport,
      reponseFromJson: getPreviousReportsResponseFromJson,
    );
    return response;
  }

  //post report
  Future<Response<PostReportResponse>?> postReport(
      {required PostReportRequest postReportRequest}) async {
    Response<PostReportResponse>? response =
        await ApiRequest<PostReportRequest, PostReportResponse>().post(
      url: ApiConstants.prevReport,
      reponseFromJson: postReportResponseFromJson,
      request: postReportRequest,
      requestToJson: postReportRequestToJson,
    );
    return response;
  }

  //upload report
  Future<String?> uploadReportFile({required File file}) async {
    var uri = Uri.parse(ApiConstants.uploadReport);
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${sharedPrefs.authToken}',
    };
    final now = DateTime.now();
    final formatter = DateFormat('yyyyMMddHHmmss');
    final id = formatter.format(now).replaceAll(RegExp(r'[^\w\s]+'), '');
    log("ApiRequest GET : $uri");
    final request = http.MultipartRequest('POST', uri);
    final multipartFile = http.MultipartFile.fromBytes(
      'file',
      await file.readAsBytes(),
      filename: id + file.path.split('.').last,
    );
    request.files.add(multipartFile);
    request.headers.addAll(requestHeaders);
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    log("ApiRequest Response ${response.statusCode} $responseBody");
    if (response.statusCode == 201) {
      return json.decode(responseBody)["url"];
    } else {
      return null;
    }
  }
}
