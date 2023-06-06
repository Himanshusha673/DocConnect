// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../utils/constants/image_konstants.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(children: [
        SizedBox(
          height: 15,
        ),
        Image.asset(
          ImagesConstants.jatyaLogoName,
          height: devicesize.height / 10,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Schedule appointments with expert doctors",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 28,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Find experienced specialist doctors with expert ratings and reviews and book your appointment hassle-free.",
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Image.asset(
          ImagesConstants.onboardingtwo,
          height: devicesize.height /3,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 75,
                width: MediaQuery.of(context).size.width / 90,
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
