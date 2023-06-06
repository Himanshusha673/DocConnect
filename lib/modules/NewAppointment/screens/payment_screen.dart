import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:doc_connect/common_components/widgets/error_alert_dialog.dart';
import 'package:doc_connect/common_components/widgets/label.dart';
import 'package:doc_connect/modules/NewAppointment/model/appointment/create_appointment.dart';
import 'package:doc_connect/modules/NewAppointment/services/appointment_repository.dart';
import 'package:doc_connect/modules/NewAppointment/widgets/recipt.dart';
import 'package:doc_connect/utils/SharePref.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';
import '../../../common_components/widgets/dotted_divider.dart';
import '../../../common_components/widgets/popup_widget.dart';
import '../../../utils/constants/color_konstants.dart';
import '../../online_consultation/widgets/doctor_card.dart';
import '../model/appointment/get_slots_response.dart';
import '../model/doctors_via_location_response.dart';
import '../model/get_clinic_detail_response.dart';

class PaymentScreen extends StatefulWidget {
  final AvailableDoctor availableDoctor;
  final Clinic clinic;
  final SlotDatum slot;
  final DateTime selectedDate;
  const PaymentScreen({
    super.key,
    required this.availableDoctor,
    required this.clinic,
    required this.slot,
    required this.selectedDate,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: ColorKonstants.greybgColor,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 50),
                  child: Text(
                    'You are trying to book an appointment with',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ),
                doctorDetial(),
                clinicDetail(),
                charges(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.85,
            child: ElevatedButton(
              onPressed: () {
                AppointmentRepository()
                    .bookAppointmnet(AppointmentRequest(
                  title:
                      "Test Appointment ${DateFormat("dd/MM/yyyy").format(widget.selectedDate)}",
                  clinicId: widget.clinic.id,
                  patientId: sharedPrefs.patientId ?? '',
                  doctorId: widget.availableDoctor.doctor.id,
                  doctorWorkingHoursId: widget.slot.id,
                  appointmentDate: widget.slot.startTime,
                  startTime: widget.slot.startTime,
                  speciality: widget.availableDoctor.doctor.specialisation,
                  isEmergency: false,
                  priorityType: "REGULAR",
                  status: "PENDING",
                  paymentStatus: "PENDING",
                  endTime: widget.slot.endTime,
                  appointmentType: "PENDING",
                ))
                    .then((value) {
                  if (value.response != null) {
                    showPopup(
                        context: context,
                        child: Recipt(
                          availableDoctor: widget.availableDoctor,
                          clinic: widget.clinic,
                          createAppointmentResponse: value.response!,
                        ));
                  } else {
                    showPopup(
                        context: context,
                        child: ErrorAlertDialog(
                            error:
                                value.error ?? "Failed to book Appointment"));
                  }
                });
              },
              child: const Text("Proceed"),
            ),
          )
        ],
      ),
    );
  }

  Widget doctorDetial() {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          const ProfileImage(
            image: ImagesConstants.doctor,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.availableDoctor.userData.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Stars(value: 5),
                  verifiedTag(context)
                ],
              ),
              Text(
                '${widget.availableDoctor.doctor.qualification} | ${widget.availableDoctor.doctor.description}',
                style: TextStyle(
                    fontSize: 12,
                    color: ColorKonstants.subHeadingTextColor.withOpacity(0.6)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget clinicDetail() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const ProfileImage(image: ImagesConstants.clinicPlaceholder),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      widget.clinic.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Label(
                      label: Row(
                        children: [
                          Icon(
                            Icons.calendar_month_rounded,
                            size: 14,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              "${DateFormat("EEE").format(widget.slot.startTime)}, ${DateFormat("MMM").format(widget.slot.startTime)} ${widget.slot.startTime.day} | ${DateFormat("hh:mm").format(widget.slot.startTime)} -${DateFormat("hh:mm").format(widget.slot.endTime)} ",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          const SizedBox(width: 4),
                        ],
                      ),
                      context: context)
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  "Clinic ID ${widget.availableDoctor.doctor.clinicId} | ${widget.clinic.address} ${widget.clinic.city} ",
                  style: TextStyle(
                      fontSize: 12,
                      color:
                          ColorKonstants.subHeadingTextColor.withOpacity(0.6)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget charges() {
    Widget chargeItem({required String title, required String amount}) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              amount,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              chargeItem(title: "Consultation charges", amount: "₹500.00 "),
              chargeItem(title: "Serive charge", amount: "₹37.56 "),
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.discount_outlined),
                        LinkText(
                            onPressed: () {
                              showPopup(context: context, child: const DiscountPopup());
                            },
                            text: "Discount Applied"),
                      ],
                    ),
                    const Text(
                      "₹200.00",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),*/
              const DottedDivider(
                height: 0.5,
              ),
              chargeItem(title: "Amount payable", amount: "₹337.56 "),
            ],
          )
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final String image;
  final double scale;
  const ProfileImage({
    super.key,
    required this.image,
    this.scale = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * scale,
      height: MediaQuery.of(context).size.width * scale,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}

class Stars extends StatelessWidget {
  final int value;
  const Stars({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    int star = value > 5 ? 5 : value;
    List<Widget> starsList = [];
    for (int i = 0; i < star; i++) {
      starsList.add(const Padding(
        padding: EdgeInsets.all(0.0),
        child: Icon(
          size: 14,
          Icons.star_rounded,
          color: Colors.amber,
        ),
      ));
    }
    for (int i = 0; i < 5 - star; i++) {
      starsList.add(Padding(
        padding: const EdgeInsets.all(0.0),
        child: Icon(
          Icons.star_rounded,
          size: 14,
          color: Colors.grey.withOpacity(0.3),
        ),
      ));
    }
    return Row(
      children: starsList,
    );
  }
}
