import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/modules/Profile/bloc/update_patient_prof_bloc/upadte_pat_state.dart';
import 'package:doc_connect/modules/Profile/bloc/update_patient_prof_bloc/update_pati_bloc.dart';
import 'package:doc_connect/modules/Profile/models/allergies/update_allergy.dart';
import 'package:doc_connect/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';
import 'package:doc_connect/modules/Profile/models/update_user_model.dart';
import 'package:doc_connect/modules/Profile/screens/patient_update_screen_tabs/allergies_tab.dart';
import 'package:doc_connect/modules/Profile/screens/patient_update_screen_tabs/demographic_tab.dart';
import 'package:doc_connect/modules/Profile/screens/patient_update_screen_tabs/previous_reports_tab.dart';
import 'package:doc_connect/modules/Profile/screens/patient_update_screen_tabs/vaccination_tab.dart';
import 'package:doc_connect/utils/SharePref.dart';

import '../../../utils/constants/color_konstants.dart';
import '../bloc/update_patient_prof_bloc/update_pat_event.dart';
import '../models/get_all_prev_reports/get_all_prev_repo.dart';
import '../models/update_patient_model/update_pati_prof.dart';

class PatientUpdateDetails extends StatefulWidget {
  GetSpecificPatientAllergydata allergy;

  PatientUpdateDetails(
      {super.key, required this.allergy} //required this.allergy
      );
  @override
  State<PatientUpdateDetails> createState() => _PatientUpdateDetailsState();
}

class _PatientUpdateDetailsState extends State<PatientUpdateDetails> {
  @override
  static PatientUpdateFormModel formModel = PatientUpdateFormModel(
      maritalStatus: "MARRIED",
      gender: "Male",
      height: "100",
      weight: "60",
      isArchived: false,
      createdAt: "2023 11:32:10",
      updatedAt: "2023 11:32:10",
      userId: sharedPrefs.id);

  static AllergyUpdateRequest allergyRequestModel = AllergyUpdateRequest();
  @override
  void initState() {
    allergyRequestModel = AllergyUpdateRequest(
      patientId: sharedPrefs.patientId,
      medicineAllergies: [],
      foodAllergies: [],
      petAllergies: [],
      other: "",
    );

    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late UpdateUserModel userDataModel;
  GetAllPrevReportsForSpecificPatient? getAllPrevReportsForSpecificPatient;
  String allergyIdToSend = "";

  bool submitForm() {
    if (_formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Form submitted successfully!'),
      //   ),
      // );
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return BlocListener<UpdatePatientProfileBloc, UpdatePatientState>(
      listener: (context, state) {
        if (state is FormSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Form submitted successfully!'),
            ),
          );
        } else if (state is FormSubmissionFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: customAppBar(),
          body: BlocBuilder(
              bloc: UpdatePatientProfileBloc(),
              builder: (context, state) {
                if (state is FormInitialState) {
                  return tabBarView();
                } else if (state is FormLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FormSuccessState) {
                  return const Center(child: Text("Form Updated"));
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }

  Widget tabBarView() {
    return Form(
      key: _formKey,
      child: TabBarView(
        children: <Widget>[
          DemographicTab(
            getData: (updateUserModel, allergyId, getAllPrevReports) {
              userDataModel = updateUserModel;
              allergyIdToSend = allergyId;
              getAllPrevReportsForSpecificPatient = getAllPrevReports;
              setState(() {});
            },
            // patientUpdateFormModel: formModel,
          ),
          AllergiesTab(
            allergy: widget.allergy,
            allergyUpdateRequest: allergyRequestModel,
          ),
          const VaccinationTab(),
          getAllPrevReportsForSpecificPatient != null
              ? PreviousReportTab(
                  reports: getAllPrevReportsForSpecificPatient,
                )
              : const PreviousReportTab()
        ],
      ),
    );
  }

  PreferredSizeWidget customAppBar() {
    return AppBar(
      title: const Text(
        'Update Profile',
        style: TextStyle(fontSize: 20.0),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(248, 248, 248, 1),
            ),
            child: const TabBar(
                physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                padding: EdgeInsets.symmetric(horizontal: 20),
                isScrollable: true,
                labelColor: ColorKonstants.primarySwatch,
                unselectedLabelColor: Colors.black87,
                indicatorColor: ColorKonstants.primarySwatch,
                tabs: [
                  Tab(
                    child: Text(
                      'Demographics',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text('Allergies', style: TextStyle(fontSize: 16)),
                  ),
                  Tab(
                    child: Text('Vaccinations', style: TextStyle(fontSize: 16)),
                  ),
                  Tab(
                    child: Text('Previous Reports',
                        style: TextStyle(fontSize: 16)),
                  ),
                ]),
          )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
              onPressed: () {
                // allergyRequestModel.other = "asasa";
                if (submitForm()) {
                  BlocProvider.of<UpdatePatientProfileBloc>(context).add(
                      PatientUpdateFormSubmitted(
                          form: userDataModel,
                          allergyUpdateRequest: allergyRequestModel,
                          allergyId: allergyIdToSend));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Please Enter required Fields'),
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Perform some action when the user presses the "Undo" button
                        },
                      ),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.check)),
        ),
      ],
    );
  }
}
