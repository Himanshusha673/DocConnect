import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/common_components/widgets/link_text.dart';
import 'package:jatya_patient_mobile/modules/Mediline/widgets/share_with_clinic_card.dart';
import 'package:jatya_patient_mobile/modules/Mediline/widgets/single_mediline_card.dart';

import '../bloc/mediline_bloc.dart';
import '../models/get_appointmens_response.dart';

class ShareMedilinePopup extends StatefulWidget {
  final AppointmentDetail appointmentDetail;
  const ShareMedilinePopup({super.key, required this.appointmentDetail});

  @override
  State<ShareMedilinePopup> createState() => _ShareMedilinePopupState();
}

class _ShareMedilinePopupState extends State<ShareMedilinePopup> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Column(
          children: [
            medilineDetail(),
            clinicList(),
          ],
        ),
      ),
    );
  }

  Widget medilineDetail() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade200.withOpacity(0.5),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Share your mediline"),
              LinkText(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: "close"),
            ],
          ),
          // const SingleMedilineCard(),
          const SizedBox(
            height: 8,
          ),
          SingleMedilineCard(appointmentDetail: widget.appointmentDetail)
        ],
      ),
    );
  }

  Widget clinicList() {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<MedilineBloc, MedilineState>(
          builder: (context, state) {
            return Column(
              children: state.clinicList
                      ?.map((e) => ShareWithClinicCard(
                            clinic: e,
                            appointmentDetail: widget.appointmentDetail,
                          ))
                      .toList() ??
                  [],
            );
          },
        ),
      ),
    );
  }
}
