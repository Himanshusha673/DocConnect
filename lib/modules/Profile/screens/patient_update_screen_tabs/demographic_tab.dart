import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:doc_connect/common_components/widgets/drop_down_field.dart';
import 'package:doc_connect/modules/Profile/bloc/patientBloc/patient_bloc.dart';
import 'package:doc_connect/modules/Profile/bloc/patientBloc/patient_event.dart';
import 'package:doc_connect/modules/Profile/bloc/patientBloc/patient_state.dart';
import 'package:doc_connect/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';
import 'package:doc_connect/modules/Profile/models/update_user_model.dart';
import 'package:doc_connect/modules/Profile/widgets/validations.dart';
import 'package:doc_connect/utils/SharePref.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';
import 'package:doc_connect/utils/constants/items_konstants.dart';

import '../../../../common_components/widgets/text_form_field.dart';
import '../../models/get_all_prev_reports/get_all_prev_repo.dart';

class DemographicTab extends StatefulWidget {
  // final UpdateUserModel patientUpdateFormModel;
  final void Function(
      UpdateUserModel, String, GetAllPrevReportsForSpecificPatient) getData;
  const DemographicTab({
    super.key,
    required this.getData,
    // required this.patientUpdateFormModel,
  });

  @override
  State<DemographicTab> createState() => _DemographicTabState();
}

class _DemographicTabState extends State<DemographicTab> {
  final TextEditingController _nameCntroller = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _heightontroller = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _firstAddressController = TextEditingController();

  final TextEditingController _secondAddressController =
      TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  bool issDateSelected = false;
  final DateTime _date = DateTime.now();
  String newDate = "";
  String genderval = 'MALE';
  String maritalValue = "MARRIED";
  String cityValue = 'Select';
  String stateValue = 'Select';
  String countryValue = 'Select';
  String _mobile = "";

  Future _selectDate(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2050));

    if (datePicker != null && datePicker != _date) {
      newDate = datePicker.toString();
      newDate = newDate.replaceRange(10, 23, "");
      DateTime oldDate = DateTime.parse(newDate);
      String newDateString = DateFormat('dd/MM/yyyy').format(oldDate);
      setState(() {
        issDateSelected = true;
        _dobController.text = newDateString;
        updatedUserDetails.dateOfBirth = datePicker;
        widget.getData.call(
            updatedUserDetails, allergyId, getAllPrevReportsForSpecificPatient);
      });
    }
  }

  late PatientBloc _patientBloc;
  late GetSpecificPatientDataById _patientData;
  late UpdateUserModel updatedUserDetails;
  late GetAllPrevReportsForSpecificPatient getAllPrevReportsForSpecificPatient;
  String allergyId = '';

  @override
  void initState() {
    super.initState();
    log(sharedPrefs.name!);
    _patientBloc = PatientBloc();
    _patientBloc.add(FetchPatientData());
    _patientBloc.stream.listen((state) {
      if (state is PatientSuccessState) {
        setState(() {
          if (state.data?.data != null) {
            _patientData = state.data!.data;
          }
          genderval = _patientData.userData.gender == "null"
              ? "MALE"
              : _patientData.userData.gender ?? "MALE";
          maritalValue = _patientData.patient.maritalStatus == "Null"
              ? "MARRIED"
              : _patientData.patient.maritalStatus ?? "MARRIED";
          _nameCntroller.text = sharedPrefs.name!;
          _emailController.text = sharedPrefs.emailId ?? "Ehsaan@gmail.com";
          String newDateString = DateFormat('dd/MM/yyyy').format(
              DateTime.parse(_patientData.userData.dateOfBirth.toString()));
          _dobController.text = newDateString;
          _firstAddressController.text =
              _patientData.userData.address ?? "Address 1";
          _secondAddressController.text =
              _patientData.userData.address ?? "Address 2";
          _zipCodeController.text = _patientData.userData.pinCode ?? "123456";
          _mobile = _patientData.userData.phoneNumber;
          if (ItemsConstants.cityItems.contains(_patientData.userData.city)) {
            cityValue = _patientData.userData.city;
          } else {
            cityValue = "Select";
          }
          if (ItemsConstants.stateItems.contains(_patientData.userData.state)) {
            stateValue = _patientData.userData.state;
          } else {
            stateValue = "Select";
          }
          if (ItemsConstants.countryItems
              .contains(_patientData.userData.country)) {
            countryValue = _patientData.userData.country;
          } else {
            countryValue = "Select";
          }

          getAllPrevReportsForSpecificPatient = state.prevReports;
          allergyId = _patientData.allergies.isEmpty
              ? ""
              : _patientData.allergies[0].id.toString();

          updatedUserDetails = UpdateUserModel(
            name: _nameCntroller.text,
            photo: _patientData.userData.photo,
            phoneNumber: _mobile,
            address: _firstAddressController.text,
            city: cityValue,
            state: stateValue,
            country: countryValue,
            pinCode: _zipCodeController.text,
            dateOfBirth: _patientData.userData.dateOfBirth,
            gender: genderval,
          );
          widget.getData.call(updatedUserDetails, allergyId,
              getAllPrevReportsForSpecificPatient);
        });

        // log("check1${_patientData.maritalStatus}");

        // log("${_patientData.gender}");

        // log(sharedPrefs.name!);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameCntroller.dispose();
    _heightontroller.dispose();
    _dobController.dispose();
    _weightController.dispose();
    _firstAddressController.dispose();
    _secondAddressController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 10, 32, 13),
      child:
          SingleChildScrollView(child: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, state) {
          if (state is PatientInitialState) {
            BlocProvider.of<PatientBloc>(context).add(FetchPatientData());
            return const Center(child: CircularProgressIndicator());
          } else if (state is PatientLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PatientSuccessState) {
            return body(
              context,
            );
          } else {
            return Center(
                child: body(
              context,
            ));
          }
        },
      )),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Align(
            heightFactor: 1.3,
            alignment: Alignment.topLeft,
            child: Text("MOBILE #",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey))),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                '🇮🇳',
                style: TextStyle(color: Color(0xff666666)),
              ),
              const SizedBox(
                height: 45,
                child: VerticalDivider(
                  thickness: 2,
                  width: 20,
                  color: Colors.grey,
                ),
              ),
              Text(
                _mobile,
                style: const TextStyle(color: Color(0xff666666)),
              )
            ],
          ),
        ),
        BoxTextField(
          validator: (String? name) => Validations.nameValidator(name),
          controller: _nameCntroller,
          keyboardType: TextInputType.name,
          onChanged: (val) {},
          label: "PATIENT NAME",
          hintText: sharedPrefs.name,
          isAstrick: true,
          onTap: () {},
          onChange: () {
            updatedUserDetails.name = _nameCntroller.text;
            widget.getData.call(updatedUserDetails, allergyId,
                getAllPrevReportsForSpecificPatient);
          },
        ),
        BoxTextField(
          readOnly: true,
          controller: _dobController,
          hintText: '12/10/1995',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Empty Text!!!Please fill';
            }
            return null;
          },
          suffix: IconButton(
            onPressed: () {
              _selectDate(context);
            },
            icon: const Icon(Icons.calendar_month_rounded),
            color: ColorKonstants.primarySwatch,
          ),
          onTap: () {},
          label: "DATE OF BIRTH",
          isAstrick: true,
          onChange: () {},
          onChanged: (val) {},
        ),
        CommonDropDownButton(
          item: ItemsConstants.genderItems,
          value: genderval,
          onChanged: (String? newValue) {
            updatedUserDetails.gender = newValue!;
            widget.getData.call(updatedUserDetails, allergyId,
                getAllPrevReportsForSpecificPatient);
            // setState(() {
            //   genderval = newValue!;
            //   widget.patientUpdateFormModel.gender = newValue;
            // });
          },
          label: 'SEX',
          isAstrick: true,
        ),
        BoxTextField(
          validator: (String? email) => Validations.emailValidator(email),
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onTap: () {},
          label: "EMAIL ID",
          hintText: _emailController.text,
          isAstrick: false,
          onChange: () {},
          onChanged: (val) {},
        ),
        CommonDropDownButton(
          item: ItemsConstants.maritalItems,
          value: maritalValue,
          onChanged: (String? newValue) {
            setState(() {
              if (newValue != null) {
                // widget.patientUpdateFormModel.maritalStatus = newValue;
                maritalValue = newValue;

                widget.getData.call(updatedUserDetails, allergyId,
                    getAllPrevReportsForSpecificPatient);
              }
            });
          },
          label: 'MARITAL STATUS',
        ),
        BoxTextField(
          validator: (String? height) => Validations.validateHeight(height),
          controller: _heightontroller,
          keyboardType: TextInputType.number,
          onChanged: (val) {
            setState(() {
              // widget.patientUpdateFormModel.height = val;
            });
          },
          label: "HEIGHT",
          isAstrick: false,
          suffix: const Padding(
            padding: EdgeInsets.only(top: 15, left: 20),
            child: Text(
              "cm",
              style:
                  TextStyle(fontSize: 16, color: ColorKonstants.primarySwatch),
            ),
          ),
          onTap: () {},
          onChange: () {},
        ),
        BoxTextField(
          validator: (String? weight) => Validations.validateWeight(weight),
          controller: _weightController,
          keyboardType: TextInputType.number,
          onTap: () {},
          label: "WEIGHT",
          isAstrick: false,
          suffix: const Padding(
              padding: EdgeInsets.only(top: 15, left: 20),
              child: Text(
                "Kg",
                style: TextStyle(
                    fontSize: 16, color: ColorKonstants.primarySwatch),
              )),
          onChanged: (val) {
            setState(() {
              // widget.patientUpdateFormModel.weight = val;
            });
          },
          onChange: () {},
        ),
        BoxTextField(
          validator: (String? val) => Validations.validateAddress(val),
          controller: _firstAddressController,
          keyboardType: TextInputType.streetAddress,
          onTap: () {},
          label: "ADDRESS LINE 1",
          hintText: "Enter",
          isAstrick: false,
          onChange: () {},
          onChanged: (val) {
            updatedUserDetails.address = val;
            widget.getData.call(updatedUserDetails, allergyId,
                getAllPrevReportsForSpecificPatient);
          },
        ),
        BoxTextField(
          validator: (String? val) => Validations.validateAddress(val),
          controller: _secondAddressController,
          keyboardType: TextInputType.streetAddress,
          onTap: () {},
          label: "ADDRESS LINE 2",
          hintText: "Enter",
          isAstrick: false,
          onChange: () {},
          onChanged: (val) {},
        ),
        CommonDropDownButton(
          item: ItemsConstants.cityItems,
          value: cityValue,
          onChanged: (String? newValue) {
            setState(() {
              cityValue = newValue!;
            });
            updatedUserDetails.city = cityValue;
            widget.getData.call(updatedUserDetails, allergyId,
                getAllPrevReportsForSpecificPatient);
          },
          label: 'CITY',
        ),
        CommonDropDownButton(
          item: ItemsConstants.stateItems,
          value: stateValue,
          onChanged: (String? newValue) {
            setState(() {
              stateValue = newValue!;
            });
            updatedUserDetails.state = stateValue;
            widget.getData.call(updatedUserDetails, allergyId,
                getAllPrevReportsForSpecificPatient);
          },
          label: 'STATE',
        ),
        CommonDropDownButton(
          item: ItemsConstants.countryItems,
          value: countryValue,
          onChanged: (String? newValue) {
            setState(() {
              countryValue = newValue!;
            });
            updatedUserDetails.country = countryValue;
            widget.getData.call(updatedUserDetails, allergyId,
                getAllPrevReportsForSpecificPatient);
          },
          label: 'Country',
        ),
        BoxTextField(
          validator: (String? zip) => Validations.validateZipPostalCode(zip),
          controller: _zipCodeController,
          keyboardType: TextInputType.number,
          onTap: () {},
          label: "ZIP/Postal Code",
          isAstrick: false,
          hintText: "Placeholder",
          onChange: () {},
          onChanged: (val) {
            updatedUserDetails.pinCode = val;
            widget.getData.call(updatedUserDetails, allergyId,
                getAllPrevReportsForSpecificPatient);
          },
        ),
      ],
    );
  }
}
