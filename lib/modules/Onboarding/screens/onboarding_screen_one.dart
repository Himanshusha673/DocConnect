// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            ImagesConstants.jatyaLogoName,
            height: devicesize.height / 10,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Find the best doctors in your city",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                  fontFamily: 'Proxima Nova'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "With the help of our intelligent algorithms, now locate the best doctors around your city at total ease",
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset(
            ImagesConstants.onboardingone,
            height: devicesize.height / 3.5,
            fit: BoxFit.cover,
          ),
        ]),
      ),
    );
  }
}
