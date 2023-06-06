import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:doc_connect/modules/Profile/models/allergies/update_allergy.dart';
import 'package:doc_connect/modules/Profile/models/allergies/update_allergy_response.dart';
import 'package:doc_connect/modules/Profile/models/get_all_prev_reports/get_all_prev_repo.dart';
import 'package:doc_connect/modules/Profile/models/get_all_vaccination/get_all_vacc_spec_pat.dart';
import 'package:doc_connect/modules/Profile/models/allergies/get_allergies_model.dart';

import 'package:doc_connect/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';
import 'package:doc_connect/modules/Profile/models/update_patient_model/update_pati_prof.dart';
import 'package:doc_connect/modules/Profile/models/update_user_model.dart';
import 'package:doc_connect/utils/constants/api_konstants.dart';
import '../models/get_speci_by_uid/get_spe_pat_uid_Data.dart';

class PatientRepository {
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
  // get a specific patient by Id
  static Future<GetSpecificPatientresponse?> fetchPatientData(
      String? userId, String? token) async {
    var response = await http.get(
        Uri.parse("${ApiConstants.specificPatient}/$userId?userData=true"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    log(response.body.toString());

    if (response.statusCode == 200) {
      try {
        GetSpecificPatientresponse getPatientModel =
            GetSpecificPatientresponse.fromJson(jsonDecode(response.body));
        log(getPatientModel.message.toString());

        return getPatientModel;
      } catch (e) {
        print(e.toString());
        throw Exception(e.toString());
      }
    } else {
      if (kDebugMode) {
        print("Exception");
      }
      return null;
      //throw Exception(response.reasonPhrase);
    }
  }

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
  // get a specific patient by UId
  static Future<GetSpecificPatientresponseByUid?> fetchPatientDataByUid(
      String? userId, String? token) async {
    //log("calling in method $userId toke is $token");
    // print(object)
    String mockUserID = "1";
    String mockAuthToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBhdGllbnRAZ21haWwuY29tIiwicnNuIjoiNThmYTc5YWYtZDZkMC00ZDNlLTlmMDktNzIwNTRlMGJjYTdmIiwiaWF0IjoxNjgxOTU4MjI0LCJleHAiOjE2ODIxMzEwMjR9.OhSxJRyHPs9ivEZARUDraXEjdDMz89V9EWTUbn2P9rs";

    var response = await http
        .get(Uri.parse("${ApiConstants.getPatientByuid}/$userId"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      try {
        log(response.body.toString());
        GetSpecificPatientresponseByUid getPatientModel =
            GetSpecificPatientresponseByUid.fromJson(jsonDecode(response.body));
        log(getPatientModel.message.toString());
        // GetSpecificPatientDataByUid getPatientData = getPatientModel.data!;
        // model = getPatientData.patient!;
        // //log("PatientId is${getPatientData.allergies![0].patientId!}");
        // sharedPrefs.setPatientId(getPatientData.allergies![0].patientId!);

        // log(model.gender.toString());
        return getPatientModel;
      } catch (e) {
        print(e.toString());
        throw Exception(e.toString());
      }
      // print(response.body.toString());
    } else {
      print("Exception");
      throw Exception(response.reasonPhrase);
    }
  }

  //////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// get all vaccination for a specific patient
  static Future<GetAllvaccinationForSpecificPatient>
      fetchAllVaccinationforSpecPatient(String patientId, String? token) async {
    GetAllvaccinationForSpecificPatient model;
    var response = await http
        .get(Uri.parse("${ApiConstants.vaccination}/$patientId"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (kDebugMode) {
      print("fine in vaccination");
    }

    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      try {
        model = GetAllvaccinationForSpecificPatient.fromJson(
            jsonDecode(response.body));
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
        print("Exception while fetching vaccination ");
      }
      throw Exception(response.reasonPhrase);
    }
  }

  //////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// get all prevReports for a specific patient
  static Future<GetAllPrevReportsForSpecificPatient>
      fetchAllPrevreportsforSpecPatient(
          String? patientId, String? token) async {
    GetAllPrevReportsForSpecificPatient model;
    var response = await http.get(
        Uri.parse("${ApiConstants.getPrevReport}patientId=$patientId"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    log("${Uri.parse("${ApiConstants.getPrevReport}patientId=$patientId")}");
    log(response.body.toString());
    if (response.statusCode == 200) {
      try {
        model = GetAllPrevReportsForSpecificPatient.fromJson(
            jsonDecode(response.body));
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
        print("Exception while Fetching Prev reports");
      }
      throw Exception(response.reasonPhrase);
    }
  }
  //////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

// Update patient
  static Future<PatientUpdateFormModel> updateUserDemographic(
      UpdateUserModel form, String id, String token) async {
    Map<String, dynamic> dataForm = form.toJson();
    // if (kDebugMode) {
    //   print(dataForm);
    // }
    log("data is ${dataForm.toString()}");
    log("id is $id");
    log("token is $token");
    try {
      var response = await http.put(
        Uri.parse("${ApiConstants.userUpdate}/$id"),
        body: jsonEncode(dataForm),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      log('${Uri.parse("${ApiConstants.userUpdate}/$id")}');
      log(response.body.toString());
      if (response.statusCode == 200) {
        PatientUpdateFormModel responseData =
            PatientUpdateFormModel.fromJson(jsonDecode(response.body));
        return responseData;
      } else {
        throw Exception("Failed to update form data");
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
  //////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

  //Get allergies value
  static Future<AllergieModel> fetchAllergies(
      String? userId, String? token) async {
    AllergieModel model;
    log(" in allergy");

    var response =
        await http.get(Uri.parse(ApiConstants.allAllergies), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    log(response.statusCode.toString());

    log(response.body.toString());
    if (response.statusCode == 200) {
      try {
        log(response.body.toString());
        model = AllergieModel.fromJson(jsonDecode(response.body.toString()));

        return model;
      } catch (e) {
        throw Exception(e.toString());
      }
    } else {
      if (kDebugMode) {
        print("Exception in Allergies");
      }
      throw Exception(response.reasonPhrase);
    }
  }

  //update allergies
  // Update patient
  static Future<AllergyUpdateResponse?> updateAllergies(
      AllergyUpdateRequest form, String allergyId, String token) async {
    Map<String, dynamic> dataForm = form.toJson();
    // if (kDebugMode) {
    //   print(dataForm);
    // }
    log("data is ${dataForm.toString()}");

    log("token is $token");
    try {
      var response = await http.patch(
        Uri.parse("${ApiConstants.allAllergies}/$allergyId"),
        body: jsonEncode(dataForm),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log('${Uri.parse("${ApiConstants.allAllergies}/$allergyId")}');
      log(response.body.toString());
      if (response.statusCode == 200) {
        AllergyUpdateResponse responseData =
            AllergyUpdateResponse.fromJson(jsonDecode(response.body));
        return responseData;
      } else {
        return null;
        //throw Exception("Failed to update form data");
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
