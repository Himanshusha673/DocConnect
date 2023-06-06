import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/common_components/widgets/app_alert_dialog.dart';
import 'package:doc_connect/modules/Profile/bloc/vaccinations_bloc/vaccinations_bloc.dart';
import 'package:doc_connect/modules/online_consultation/widgets/start_consultation_alert.dart';

import '../../widgets/vaccinations/vaccination_form.dart';

class VaccinationTab extends StatefulWidget {
  const VaccinationTab({super.key});

  @override
  State<VaccinationTab> createState() => _VaccinationTabState();
}

class _VaccinationTabState extends State<VaccinationTab> {
  @override
  void initState() {
    context
        .read<VaccinationsBloc>()
        .add(const VaccinationsGetVaccineListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VaccinationsBloc, VaccinationsState>(
      listener: (context, state) {
        if (state is VaccinationCreated) {
          showPopup(context: context, child: successMessage(context));
          // context.read<VaccinationsBloc>().add(const VaccinationReInitializeEvent());
        }
      },
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              vaccineList(),
              const VaccinationEntryForm(),
            ],
          ),
        ),
      ),
    );
  }

  AppAlertDialog successMessage(BuildContext context) {
    return AppAlertDialog(
        iconColor: Colors.green,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          children: [
            const Text("Vaccination Added Successfully"),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<VaccinationsBloc>()
                      .add(const VaccinationsGetVaccineListEvent());

                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            )
          ],
        ));
  }

  Widget vaccineList() {
    return BlocBuilder<VaccinationsBloc, VaccinationsState>(
      builder: (context, state) {
        return Column(
          children: state.vaccineList
              .map((e) => VaccinationEntryForm(
                    vaccine: e,
                  ))
              .toList(),
        );
      },
    );
  }
}
