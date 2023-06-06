import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/common_components/widgets/date_picker.dart';
import 'package:jatya_patient_mobile/common_components/widgets/error_alert_dialog.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/vaccination/vaccine.dart';
import 'package:jatya_patient_mobile/modules/Profile/widgets/vaccinations/certificate_image.dart';
import 'package:jatya_patient_mobile/modules/online_consultation/widgets/start_consultation_alert.dart';

import '../../../../common_components/widgets/common_upload_box.dart';
import '../../../../common_components/widgets/dropdown.dart';
import '../../bloc/vaccinations_bloc/vaccinations_bloc.dart';

class VaccinationEntryForm extends StatefulWidget {
  final Vaccine? vaccine;
  const VaccinationEntryForm({super.key, this.vaccine});

  @override
  State<VaccinationEntryForm> createState() => _VaccinationEntryFormState();
}

class _VaccinationEntryFormState extends State<VaccinationEntryForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          BlocBuilder<VaccinationsBloc, VaccinationsState>(
            builder: (context, state) {
              return DropDownWidget(
                title: "VACCINATION NAME",
                options: state.vaccineOptions,
                selectedItem: widget.vaccine != null
                    ? DropDownItem(name: widget.vaccine!.vaccineName)
                    : state.vaccineName,
                onChanged: (value) => context
                    .read<VaccinationsBloc>()
                    .add(VaccinationsNameChangedEvent(vaccineName: value)),
              );
            },
          ),
          BlocBuilder<VaccinationsBloc, VaccinationsState>(
            builder: (context, state) {
              return DatePicker(
                  title: "VACCINATION DATE",
                  width: MediaQuery.of(context).size.width,
                  initialDate: widget.vaccine != null
                      ? widget.vaccine!.date
                      : state.date,
                  onChanged: (value) => context.read<VaccinationsBloc>().add(
                      VaccinationsDateChangedEvent(date: value.toString())));
            },
          ),
          BlocBuilder<VaccinationsBloc, VaccinationsState>(
            builder: (context, state) {
              log("message${state.image?.path}");
              log(state.vaccineList.toString());
              return GestureDetector(
                  onTap: () async {
                    if (widget.vaccine != null) {
                      return;
                    }
                    if (state.vaccineName == null) {
                      showPopup(
                          context: context,
                          child: const ErrorAlertDialog(
                              error: "Select Vaccine Name"));
                      return;
                    }
                    if (state.date == null) {
                      showPopup(
                          context: context,
                          child: const ErrorAlertDialog(error: "Select Date"));
                      return;
                    }
                    FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                    ).then((value) {
                      if (value != null) {
                        log("image  ${value.files.single.path}");
                        context.read<VaccinationsBloc>().add(
                            VaccinationsImageChangedEvent(
                                image: File(value.files.single.path ?? '')));
                        context
                            .read<VaccinationsBloc>()
                            .add(VaccinationsAddVaccinationDetailEvent(
                                vaccine: Vaccine(
                              date: state.date!,
                              image: state.image ??
                                  File(value.files.single.path ?? ''),
                              vaccineName: state.vaccineName!.name,
                            )));
                        context
                            .read<VaccinationsBloc>()
                            .add(const VaccinationsGetVaccineListEvent());
                      }
                    });
                  },
                  child: widget.vaccine != null
                      ? VaccineCertificateImage(
                          image: widget.vaccine!.image,
                          imageUrl: widget.vaccine!.imageurl,
                        )
                      : CommonUploadReport(
                          isDisabled:
                              state.vaccineName == null || state.date == null,
                        ));
            },
          ),
        ],
      ),
    );
  }
}
