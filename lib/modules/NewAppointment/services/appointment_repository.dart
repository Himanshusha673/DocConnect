import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:doc_connect/modules/NewAppointment/model/appointment/create_appointment.dart';
import 'package:doc_connect/modules/NewAppointment/model/appointment/create_appointment_response.dart';
import 'package:doc_connect/modules/NewAppointment/model/doctors_via_location_response.dart';

import '../../../common_components/services/api_requests.dart';
import '../../../utils/constants/api_konstants.dart';
import '../model/appointment/get_slots_response.dart';
import '../model/doctor/doctor-detail_response.dart';
import '../model/get_clinic_detail_response.dart';
import 'location_manager.dart';

class AppointmentRepository {
  //get doctors from location
  Future<List<AvailableDoctor>?> getDoctors({
    required int range,
    required String gender,
    required String speciality,
    required String date,
  }) async {
    // await getLocationPermission();
    late Position position;
    final hasPermission = await LocationManager().handleLocationPermission();
    if (hasPermission) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position p) {
        position = p;
      }).catchError((e) {
        debugPrint(e);
      });
    }
    log(position.latitude.toString());
    GeoLocationDoctorsResponse? response =
        await ApiRequest<String, GeoLocationDoctorsResponse>().get(
      // url:
      //     "${ApiConstants.geoLocationDoctors}geoCoordinates=${locationData?.latitude ?? 0}, ${locationData?.longitude ?? 0}&range=$range&speciality=$speciality&date=$date",
      // url: "${ApiConstants.geoLocationDoctors}geoCoordinates=${position.latitude}, ${position.longitude}&range=$range&speciality=gestro&date=$date",
      url:
          "${ApiConstants.geoLocationDoctors}geoCoordinates=-30.9501, -154.0226&range=$range&speciality=Urologist&date=$date",

      reponseFromJson: geoLocationDoctorsResponseFromJson,
    );
    List<AvailableDoctor>? list = response?.data;
    return list;
  }

  Future<DoctorDetailResponse?> getDcotorDetail(
      {required String doctorId}) async {
    DoctorDetailResponse? response =
        await ApiRequest<String, DoctorDetailResponse>().get(
      url: "${ApiConstants.doctorDetail}/$doctorId",
      reponseFromJson: doctorDetailResponseFromJson,
    );

    return response;
  }

  Future<Response<CreateAppointmentResponse>> bookAppointmnet(
      AppointmentRequest appointmentRequest) async {
    return await ApiRequest<AppointmentRequest, CreateAppointmentResponse>()
        .post(
      url: ApiConstants.appointment,
      reponseFromJson: createAppointmentResponseFromJson,
      request: appointmentRequest,
      requestToJson: appointmentRequestToJson,
    );
  }

  Future<GetSlotsResponse?> getSlots(
      {required DateTime date, required String doctorId}) async {
    GetSlotsResponse? response =
        await ApiRequest<String, GetSlotsResponse>().get(
      url:
          "${ApiConstants.slots}?date=${DateFormat("yyyy-MM-dd").format(date)}&doctorId=$doctorId",
      reponseFromJson: getSlotsResponseFromJson,
    );

    return response;
  }

  Future<GetClinicDetailResponse?> getClinicDetail(
      {required String clinicId}) async {
    GetClinicDetailResponse? response =
        await ApiRequest<String, GetClinicDetailResponse>().get(
      url: "${ApiConstants.clinic}/$clinicId",
      reponseFromJson: getClinicDetailResponseFromJson,
    );

    return response;
  }
}
