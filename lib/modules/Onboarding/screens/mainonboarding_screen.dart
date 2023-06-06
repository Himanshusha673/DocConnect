import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/modules/Auth/screens/register_screen.dart';
import 'package:jatya_patient_mobile/utils/constants/color_konstants.dart';

import 'onboarding_screen_one.dart';
import 'onboarding_screen_three.dart';
import 'onboarding_screen_two.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({super.key});

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> {
  late PageController _pageController;
  int currentIndex = 0;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorKonstants.onBoardingBackgroudColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    PageView(
                      onPageChanged: onChangedFunction,
                      controller: _pageController,
                      children: const [
                        OnboardingScreenOne(),
                        OnboardingScreenTwo(),
                        OnboardingScreenThree()
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 2,
                            color: currentIndex != 0
                                ? ColorKonstants.primaryColor
                                : Colors.transparent,
                          )),
                      height: 38,
                      width: 38,
                      child: Opacity(
                        opacity: currentIndex != 0 ? 1 : 0,
                        child: FloatingActionButton(
                          heroTag: null,
                          elevation: 0,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            currentIndex != 0 ? previousFunction() : () {};
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: ColorKonstants.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Indicator(
                              positionIndex: 0,
                              currentIndex: currentIndex,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Indicator(
                              positionIndex: 1,
                              currentIndex: currentIndex,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Indicator(
                              positionIndex: 2,
                              currentIndex: currentIndex,
                            ),
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.grey,
                          ),
                          onPressed: () {
                            navigateToMyJatya(context);
                          },
                          child: const Text(
                            "skip",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    // Center(
                    //   child: SmoothPageIndicator(count: 3, controller: ),
                    // ),
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: FloatingActionButton(
                        heroTag: null,
                        elevation: 0,
                        onPressed: () => currentIndex != 2
                            ? nextFunction()
                            : navigateToMyJatya(context),
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToMyJatya(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator(
      {super.key, required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          border: Border.all(
            color: positionIndex == currentIndex ? Colors.blue : Colors.grey,
          ),
          color: positionIndex == currentIndex ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
