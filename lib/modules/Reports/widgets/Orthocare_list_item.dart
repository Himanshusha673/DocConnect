
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jatya_patient_mobile/modules/Reports/screens/Orthocare_tab.dart';
import 'package:jatya_patient_mobile/modules/Reports/screens/neurowell._tab.dart';

import '../../../utils/constants/image_konstants.dart';



class ClinicListItem extends StatelessWidget {
  final List<String> imageUrls;
  final OrthocareModel clinicModel;

  const ClinicListItem({
    Key? key,
    required this.clinicModel,
    required this.imageUrls
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 100,
        height: 40,
        child:  Stack(
            children: [
              Positioned(
                left: 0,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.grey.shade300,
                  child: SvgPicture.asset(ImagesConstants.reportDrawer),
                ),
              ),
              const Positioned(
                left: 30.0,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage(ImagesConstants.circleavatar2),
                ),
              ),
              const Positioned(
                left: 60.0,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage(ImagesConstants.clinicPlaceholder),
                ),
              ),]
        ),
      ),
      title: Text(clinicModel.title!,style: const TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(clinicModel.date!),
      trailing: Container(
        margin: const EdgeInsets.only(top: 0,bottom: 20,right: 10),
        width: 60,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(220, 179, 218, 255),
        ),
        child: Column(children: [
          Row(
            children:const [
              Padding(
                padding:
                EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "SHARED",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, fontSize: 11),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
