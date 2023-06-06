import 'package:jatya_patient_mobile/modules/Mediline/models/get_appointmens_response.dart';
import 'package:jatya_patient_mobile/modules/Mediline/models/share_appointment_request.dart';

import '../../../common_components/services/api_requests.dart';
import '../../../utils/SharePref.dart';
import '../../../utils/constants/api_konstants.dart';
import '../models/get_clinic_response.dart';
import '../models/share_appointment_response.dart';

class MedilineRepository {
  Future<GetAppointmentResponse?> getappointementsofPatient() async {
    GetAppointmentResponse? response = await ApiRequest<String, GetAppointmentResponse>().get(
      url: "${ApiConstants.getAllAppointments}patientId=${sharedPrefs.patientId}",
      reponseFromJson: getAppointmentResponseFromJson,
    );
    return response;
  }

  Future<GetAllClinicResopnse?> getclinics() async {
    GetAllClinicResopnse? response = await ApiRequest<String, GetAllClinicResopnse>().get(
      url: "${ApiConstants.getClinic}userid=${sharedPrefs.id}",
      reponseFromJson: getAllClinicResopnseFromJson,
    );
    return response;
  }

  Future<GetAppointmentResponse?> getAppointmentsSearch({required String search}) async {
    GetAppointmentResponse? response = await ApiRequest<String, GetAppointmentResponse>().get(
      url: "${ApiConstants.getAllAppointments}patientId=${sharedPrefs.patientId}&search=$search",
      reponseFromJson: getAppointmentResponseFromJson,
    );
    return response;
  }

  //share appointment
  Future<Response<ShareAppointmentResponse>?> shareAppointment({required ShareAppointmentRequest shareAppointmentRequest}) async {
    Response<ShareAppointmentResponse>? response = await ApiRequest<ShareAppointmentRequest, ShareAppointmentResponse>().post(
      url: ApiConstants.shareAppointments,
      reponseFromJson: shareAppointmentResponseFromJson,
      request: shareAppointmentRequest,
      requestToJson: shareAppointmentRequestToJson,
    );
    return response;
  }

  //get clinics
}
