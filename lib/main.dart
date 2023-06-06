import 'package:doc_connect/firebase_options.dart';
import 'package:doc_connect/modules/Profile/bloc/patientBloc/patient_bloc.dart';
import 'package:doc_connect/modules/Profile/bloc/update_patient_prof_bloc/update_pati_bloc.dart';
import 'package:doc_connect/modules/Profile/bloc/upload_report_bloc/upload_report_blocc.dart';
import 'package:doc_connect/utils/SharePref.dart';
import 'package:doc_connect/utils/constants/theme_konstants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/Auth/screens/login_screen.dart';
import 'modules/Auth/services/auth_repository.dart';
import 'modules/Mediline/bloc/mediline_bloc.dart';
import 'modules/Mediline/bloc/search_bloc/mediline_search_bloc.dart';
import 'modules/MyJatya/bloc/upcoming_apppointment/upcoming_appointmen_bloc.dart';
import 'modules/MyJatya/screens/MyJatya.dart';
import 'modules/MyPrescription/bloc/get_prescription_bloc_bloc.dart';
import 'modules/MyPrescription/bloc/myPrescriptionBloc/my_prescription_bloc.dart';
import 'modules/NewAppointment/bloc/appointment_bloc.dart';
import 'modules/NewAppointment/services/appointment_repository.dart';
import 'modules/Onboarding/screens/mainonboarding_screen.dart';
import 'modules/Profile/bloc/previous_report_bloc/previousreport_bloc.dart';
import 'modules/Profile/bloc/upload_profile_pic_bloc/upload_profile_pic_bloc.dart';
import 'modules/Profile/bloc/vaccinations_bloc/vaccinations_bloc.dart';
import 'modules/Reports/bloc/get_recent_reports/get_all_reports_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await sharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UploadProfilePicBloc>(
            create: (context) => UploadProfilePicBloc()),
        BlocProvider<UploadProfilePicBloc>(
            create: (context) => UploadProfilePicBloc()),
        BlocProvider<UploadReportBloc>(create: (context) => UploadReportBloc()),
        BlocProvider<PatientBloc>(create: (context) => PatientBloc()),
        BlocProvider<VaccinationsBloc>(create: (context) => VaccinationsBloc()),
        BlocProvider<UpdatePatientProfileBloc>(
            create: (context) => UpdatePatientProfileBloc()),
        BlocProvider<UpcomingAppointmenBloc>(
            create: (context) => UpcomingAppointmenBloc()),
        BlocProvider<GetAllRecentReportsBloc>(
            create: (context) => GetAllRecentReportsBloc()),
        BlocProvider<GetPrescriptionBlocBloc>(
            create: (context) => GetPrescriptionBlocBloc()),
        BlocProvider<MedilineBloc>(create: (context) => MedilineBloc()),
        BlocProvider<MedilineSearchBloc>(
            create: (context) => MedilineSearchBloc()),
        BlocProvider<AppointmentBloc>(
            create: (context) => AppointmentBloc(
                appointmentRepository: AppointmentRepository())),
        BlocProvider<MyPrescriptionBloc>(
            create: (context) => MyPrescriptionBloc()),
        BlocProvider<PreviousReportBloc>(
            create: (context) => PreviousReportBloc()),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
              create: (context) => AuthRepository()),
        ],
        child: MaterialApp(
          title: 'Jayta Patient',
          debugShowCheckedModeBanner: false,
          theme: ThemeConstants.mainTheme,
          home: !sharedPrefs.onboarded!
              ? const MainOnboarding()
              : sharedPrefs.authToken == ''
                  ? const LoginScreen()
                  : const MyJatya(),
        ),
      ),
    );
  }
}
