
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jatya_patient_mobile/modules/Reports/models/clinic_model.dart';
import 'package:jatya_patient_mobile/utils/constants/image_konstants.dart';



class ClinicListItem extends StatelessWidget {
  final List<String> imageUrls;
  final AllClinicModel clinicModel;

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
            ),
          ]
          ),
        ),
      title: Text(clinicModel.title!,style: const TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(clinicModel.date!),
    );
  }
}
