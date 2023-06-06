class ApiConstants {
  static const String _baseUrl = "http://ec2-3-7-6-12.ap-south-1.compute.amazonaws.com:3000/api/v1";
  static const String _baseUrlS3 = "http://ec2-3-7-6-12.ap-south-1.compute.amazonaws.com:3000/s3";
  // auth
  static String login = "$_baseUrl/auth/login";
  static String loginPhone = "$_baseUrl/auth/login/phone";
  static String loginPhoneMfa = "$_baseUrl/auth/login/mfa/phone";
  static String forgotPassword = "$_baseUrl/auth/forgotPassword";
  static String verifyForgotPassword = "$_baseUrl/auth/forgotPassword/verify";
  static String register = "$_baseUrl/user";
  static String registerVerify = "$_baseUrl/user/verify";
  //social media
  static String googleLogin = "$_baseUrl/auth/google/login";
  static String googleRedirect = "$_baseUrl/auth/google/redirect";
  static String facebookLogin = "$_baseUrl/auth/facebook/login";
  static String facebookRedirect = "$_baseUrl/auth/facebook/redirect";
  static String twitterLogin = "$_baseUrl/auth/linkedin/login";
  static String twitter = "$_baseUrl/auth/linkedin/redirect";

  // new appointment
  static String appointment = "$_baseUrl/appointment";

  //Getting a Specific patient
  static String specificPatient = "$_baseUrl/patient";

// getting patient Id
  static String getPatientByuid = "$_baseUrl/patient/user-id";

  //Update Patient Data
  static String updatePatient = "$_baseUrl/patient";

  //getting allergies
  static String allAllergies = "$_baseUrl/allergy";

  // get vaccination
  static String vaccination = "$_baseUrl/vaccination?";
  static String uploadReport = "$_baseUrlS3/files/upload/reports";

  // get vaccination
  static String getPrevReport = "$_baseUrl/patientReport?";
  static String prevReport = "$_baseUrl/patientReport";

  // get all Notifications
  static String getAllNotifications = "$_baseUrl/notification?";

  //undo all notifications
  static String undoAllNotifications = "$_baseUrl/notification?";

  //get all appointments
  static String getAllAppointments = "$_baseUrl/appointment?";

  //get Specific appointments
  static String getSpecificAppointments = "$_baseUrl/appointment/";

  //get all prescriptions
  static String getAllPresciriptions = "$_baseUrl/prescriptions?";

  //download prescription
  static String downloadPrescription = "$_baseUrl/prescriptions/download/";
  //cancel appointment
  static String cancelAppointments = "$_baseUrl/appointment/";

  static String getClinic = "$_baseUrl/clinic?";
  static String shareAppointments = "$_baseUrl/appointmentClinic/shareAppointment";
  //doctors
  static String geoLocationDoctors = "$_baseUrl/doctor/geo-location?";
  static String doctorDetail = "$_baseUrl/doctor";

  //slots
  static String slots = "$_baseUrl/doctor/slots";
  static String clinic = "$_baseUrl/clinic";

  // user
  static String userUpdate = "$_baseUrl/user";
}
