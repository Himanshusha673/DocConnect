import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/modules/Profile/bloc/patientBloc/patient_bloc.dart';
import 'package:doc_connect/modules/Profile/bloc/patientBloc/patient_state.dart';
import 'package:doc_connect/modules/Profile/models/allergies/update_allergy.dart';
import 'package:doc_connect/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';
import 'package:doc_connect/modules/Profile/widgets/expandable.dart';

class AllergiesTab extends StatefulWidget {
  final GetSpecificPatientAllergydata allergy;
  AllergyUpdateRequest allergyUpdateRequest;
  AllergiesTab(
      {super.key, required this.allergy, required this.allergyUpdateRequest});

  @override
  State<AllergiesTab> createState() => _AllergiesTabState();
}

class _AllergiesTabState extends State<AllergiesTab> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return BlocBuilder<PatientBloc, PatientState>(
      builder: (context, state) {
        if (state is PatientLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PatientSuccessState) {
          if (state.data!.data.allergies.isEmpty) {
            return const Center(
              child: Text("No Allergies data found"),
            );
          }
          return body(context, state.data!.data.allergies[0], widget.allergy);
        } else if (state is PatientFailureState) {
          return const Center(
            child: Text("No Allergies data found"),
          );
        } else {
          return const Center(
            child: Text("No Allergies data found"),
          );
        }
      },
    );
  }

  Widget body(BuildContext context, GetSpecificPatientAllergydata? allergyModel,
      GetSpecificPatientAllergydata allergy) {
    if (allergyModel != null) {
      widget.allergyUpdateRequest.medicineAllergies =
          allergyModel.medicineAllergies!;
      widget.allergyUpdateRequest.foodAllergies = allergyModel.foodAllergies!;
      widget.allergyUpdateRequest.petAllergies = allergyModel.petAllergies!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      child: SingleChildScrollView(
        child: Column(children: [
          ExpandableWidget(
            checkedList: widget.allergyUpdateRequest.medicineAllergies ?? [],
            unCheckedList: allergy.medicineAllergies ?? [],
            heading: "Medicines",
            icon: Icons.medication_liquid_sharp,
            isExpanded: true,
            onChanged: (String title, bool val) {
              setState(() {
                if (val) {
                  widget.allergyUpdateRequest.medicineAllergies!.add(title);
                } else {
                  widget.allergyUpdateRequest.medicineAllergies!.remove(title);
                }
              });
            },
          ),
          const SizedBox(
            height: 48,
          ),
          ExpandableWidget(
            checkedList: widget.allergyUpdateRequest.foodAllergies ?? [],
            unCheckedList: allergy.foodAllergies ?? [],
            heading: "Food & Dairy Products",
            icon: Icons.lunch_dining_outlined,
            isExpanded: true,
            onChanged: (String title, bool val) {
              setState(() {
                if (val) {
                  widget.allergyUpdateRequest.foodAllergies!.add(title);
                } else {
                  widget.allergyUpdateRequest.foodAllergies!.remove(title);
                }
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          ExpandableWidget(
              onChanged: (String title, bool val) {
                setState(() {
                  if (val) {
                    widget.allergyUpdateRequest.petAllergies!.add(title);
                  } else {
                    widget.allergyUpdateRequest.petAllergies!.remove(title);
                  }
                });
              },
              checkedList: widget.allergyUpdateRequest.petAllergies ?? [],
              unCheckedList: allergy.petAllergies ?? [],
              heading: "Pet & Furry Animals",
              icon: Icons.pets_rounded,
              isExpanded: true),
        ]),
      ),
    );
  }
}
