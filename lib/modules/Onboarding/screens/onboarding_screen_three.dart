// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../utils/constants/image_konstants.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

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
            height: 28,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Meet doctors at your home virtually",
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
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Can't go to the hospital? Book video call appointments with your preferred doctor within few minutes.",
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
          Padding(padding: EdgeInsets.only(bottom: 10),
        child: Image.asset(
            ImagesConstants.onboardingthree,
            height: devicesize.height / 2.5,
            fit: BoxFit.cover,
          ),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                  width: MediaQuery.of(context).size.width / 90,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
