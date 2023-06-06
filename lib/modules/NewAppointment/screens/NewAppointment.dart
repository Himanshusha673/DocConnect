import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/common_components/services/form_submission_status.dart';
import 'package:jatya_patient_mobile/common_components/widgets/common_drawer.dart';
import 'package:jatya_patient_mobile/common_components/widgets/error_alert_dialog.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/bloc/appointment_bloc.dart';
import 'package:jatya_patient_mobile/common_components/widgets/date_picker.dart';
import 'package:jatya_patient_mobile/common_components/widgets/dropdown.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/screens/new_appointment_result.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/services/appointment_repository.dart';
import 'package:jatya_patient_mobile/modules/online_consultation/widgets/start_consultation_alert.dart';

import '../widgets/distance_slider.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppointmentRepository(),
      child: BlocProvider(
        create: (context) => AppointmentBloc(appointmentRepository: context.read<AppointmentRepository>()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('New Appointment'),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: const Icon(
                      Icons.question_mark_rounded,
                      size: 16,
                    ),
                  ))
            ],
          ),
          drawer: const CommonDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _selectSpeciality(),
                _rangeSlider(),
                Row(
                  children: [_appointmentDate(), _isEmergencyCheckBox(context)],
                ),
                _selectGender(),
                const SizedBox(height: 16),
                _showDoctorsButton(),
                const SizedBox(height: 16),
                _showDoctors()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showDoctors() {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        if (state.formStatus is FormSubmissionFailed) {
          FormSubmissionFailed s = state.formStatus as FormSubmissionFailed;
          return Text(
            s.exception,
            style: const TextStyle(color: Colors.red),
          );
        }
        if (state.formStatus is FormSubmissionSuccess) {
          return DoctorsListWidget(
            doctors: state.doctors ?? [],
            date: state.appointmentDate ?? DateTime.now(),
          );
        }

        return Container();
      },
    );
  }

  Widget _showDoctorsButton() {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        if (state.formStatus is FormSubmitting) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            onPressed: () {
              if (state.appointmentDate == null && state.isEmergency) {
                showPopup(context: context, child: const ErrorAlertDialog(error: "Select date"));
                return;
              }
              if (state.speciality == null) {
                showPopup(context: context, child: const ErrorAlertDialog(error: "Select date"));
                return;
              }

              context.read<AppointmentBloc>().add(const ShowAvailableDoctorsEvent());
            },
            child: const Text("Show Available Doctors"),
          ),
        );
      },
    );
  }

  Widget _selectGender() {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        return DropDownWidget(
            title: 'DOCTOR GENDER',
            hint: 'select Gender',
            selectedItem: state.doctorGender,
            options: state.genderOptions,
            onChanged: (value) => context.read<AppointmentBloc>().add(DoctorGenderChangedEvent(gender: value)));
      },
    );
  }

  Widget _isEmergencyCheckBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      width: MediaQuery.of(context).size.width*0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<AppointmentBloc, AppointmentState>(
            builder: (context, state) {
              return Checkbox(
                  value: state.isEmergency,
                  onChanged: (value) => context.read<AppointmentBloc>().add(IsEmergencyChangedEvent(isEmergency: value ?? false)));
            },
          ),
          const Text('Emergency')
        ],
      ),
    );
  }

  Widget _appointmentDate() {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        return Opacity(
          opacity: state.isEmergency ? 0.3 : 1,
          child: IgnorePointer(
            ignoring: state.isEmergency,
            child: DatePicker(
                title: 'APPOINTMENT DATE',
                isMandatory: true,
                initialDate: state.appointmentDate?.toString(),
                onChanged: (value) => context.read<AppointmentBloc>().add(AppointmentDateChangedEvent(dateTime: value))),
          ),
        );
      },
    );
  }

  Widget _rangeSlider() {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        return DistanceSlider(
          isMandatory: true,
          initialValue: state.range,
          title: 'SEARCH DOCTORS WITHIN',
          onChanged: (value) => context.read<AppointmentBloc>().add(
                RangeChangedEvent(
                  range: value,
                ),
              ),
        );
      },
    );
  }

  Widget _selectSpeciality() {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        return DropDownWidget(
            title: 'SELECT SPECIALITY',
            hint: 'Select Speciality',
            isMandatory: true,
            selectedItem: state.speciality,
            options: state.specialityOptions,
            onChanged: (value) => context.read<AppointmentBloc>().add(SpecialityChangedEvent(speciality: value)));
      },
    );
  }
}
