import 'package:flutter/material.dart';

import '../../utils/constants/image_konstants.dart';

class MapIcon extends StatelessWidget {
  const MapIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.14,
      height: MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
          image: const DecorationImage(
            image: AssetImage(ImagesConstants.mapIcon),
            fit: BoxFit.cover,
          )),
    );
  }
}
