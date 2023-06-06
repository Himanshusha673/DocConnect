// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/common_components/services/form_submission_status.dart';
import 'package:jatya_patient_mobile/modules/Auth/bloc/login_phone_bloc/login_phone_bloc.dart';
import 'package:jatya_patient_mobile/modules/Auth/model/login/mfa_phone_request.dart';
import 'package:jatya_patient_mobile/modules/Auth/screens/enter_otp_screen.dart';

import 'package:jatya_patient_mobile/modules/Auth/services/auth_repository.dart';
import 'package:jatya_patient_mobile/modules/Auth/services/validators.dart';
import 'package:jatya_patient_mobile/modules/Auth/widgets/icon_title_widget.dart';

import 'package:jatya_patient_mobile/modules/Auth/widgets/phone_number_textfield.dart';
import 'package:jatya_patient_mobile/modules/MyJatya/screens/MyJatya.dart';

import '../../../common_components/widgets/error_alert_dialog.dart';
import '../../../common_components/widgets/policy_dialog.dart';
import '../../../common_components/widgets/popup_widget.dart';
import '../bloc/login_phone_bloc/login_phone_state.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/social_login_widget.dart';
import '../widgets/terms_and_copyright_widget.dart';

class PhoneNumberLoginScreen extends StatefulWidget {
  const PhoneNumberLoginScreen({super.key});

  @override
  _PhoneNumberLoginScreenState createState() => _PhoneNumberLoginScreenState();
}

class _PhoneNumberLoginScreenState extends State<PhoneNumberLoginScreen> {
  final _phoneNumberController = TextEditingController(text: '');

  final formGlobalKey = GlobalKey<FormState>();

  void _onSendOtpButtonPressed() {
    // TODO: Implement OTP sending functionality
  }

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Flag countryIcon = countryList.first;

    return BlocProvider(
      create: (context) => LoginPhoneBloc(context.read<AuthRepository>()),
      child: BlocListener<LoginPhoneBloc, LoginPhoneState>(
        listener: (context, state) {
          if (state.formStatus is FormSubmissionFailed) {
            // show poup
            // return ErrorOutput(message: state.message);
          }
          if (state is LoginPhoneSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EnterOTPScreen(
                  otpSentAddress: _phoneNumberController.text,
                  promptTitle: 'OTP sent to',
                  screenTitle: 'Login using Mobile Number',
                  buttonText: 'Submit',
                  onButtonPressed: (context1, String enteredOtp) async {
                    final value =
                        await AuthRepository().mfaPhone(mfaPhoneRequest: MfaPhoneRequest(otp: enteredOtp, validationId: state.validationId));
                    if (value?.response != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyJatya(),
                        ),
                      );
                    } else {
                      showPopup(context: context, child: ErrorAlertDialog(error: value?.error ?? "Invalid otp"));
                    }
                    return "";
                  },
                ),
              ),
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ...buildIconAndTitle(
                      titleText: 'Login using Mobile Number',
                      height: height * 0.2,
                    ),
                    SizedBox(height: height * 0.03),
                    Row(
                      children: [
                        const PhoneNumberDropdownMenu(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: SizedBox(
                            width: width * 0.65,
                            child: BlocBuilder<LoginPhoneBloc, LoginPhoneState>(builder: (context, state) {
                              return Form(
                                key: formGlobalKey,
                                child: TextFormField(
                                  validator: (phone) => Validators.phoneValidator(phone),
                                  controller: _phoneNumberController,
                                  decoration: const InputDecoration(
                                    hintText: 'Phone Number',
                                  ),
                                  onChanged: (value) => context.read<LoginPhoneBloc>().add(
                                        LoginPhoneNumberChanged(
                                          phoneNumber: value,
                                        ),
                                      ),
                                  keyboardType: TextInputType.number,
                                  // inputFormatters: <TextInputFormatter>[
                                  //   FilteringTextInputFormatter.digitsOnly
                                  // ], // Only numbers can be entered
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    BlocListener<LoginPhoneBloc, LoginPhoneState>(
                      listener: (context, state) {
                        final formStatus = state.formStatus;
                        if (state is LoginPhoneFailure) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: ErrorAlertDialog(
                                  error: state.error.toString(),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          );
                        }
                        if (state is LoginPhoneSuccess) {
                          // navigateToOTPScreen(context);
                        }
                      },
                      child: BlocBuilder<LoginPhoneBloc, LoginPhoneState>(
                        builder: (context, state) {
                          if (state.formStatus is InitialFormStatus || state.formStatus is FormSubmissionFailed) {
                            return CustomElevatedButton(
                              onPressed: () {
                                print(formGlobalKey.currentState!.validate());
                                if (formGlobalKey.currentState!.validate()) {
                                  context.read<LoginPhoneBloc>().add(const LoginPhoneSubmitted());
                                }
                              },
                              horizontalWidth: width * 0.35,
                              verticalWidth: 12,
                              text: 'Send OTP',
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'or',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SocialLoginWidget(),
                    // CustomTextButton(
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   text: 'Cancel',
                    //   fontSize: 14,
                    // ),
                    SizedBox(
                      height: height * 0.30,
                    ),
                    ...buildTermsAndCopyrightWidget(
                      termsOnPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PolicyDialog(
                              isAboutApp: false,
                              titleText: 'Terms & Conditions',
                              text:
                                  'By using our app, you agree to these terms and conditions:\n\n● You must be 18 years or older to use our app.\n● You are responsible for providing accurate and complete information when using our app.\n● You agree to use our app only for lawful purposes.\n● You will not attempt to hack, disrupt, or damage our app or any of our servers.\n● We reserve the right to terminate your access to our app at any time for any reason.',
                            );
                          },
                        );
                      },
                      privacyOnPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PolicyDialog(
                              isAboutApp: false,
                              titleText: 'Privacy Policy',
                              text:
                                  'Privacy is very important to us, and we take it seriously. This privacy policy explains how we collect, use, and protect your personal information when you use our app.\n\nWe collect certain types of information from you when you use our app, such as your name, email address, and medical history. We use this information to provide you with the best possible experience while using our app, to improve our app, and to communicate with you about important updates or changes.\n\nWe will never share your personal information with any third parties without your consent, except as required by law or to comply with legal process. We use industry-standard security measures to protect your personal information from unauthorized access or disclosure.',
                            );
                          },
                        );
                      },
                      cookieOnPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void navigateToOTPScreen(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => EnterOTPScreen(
  //         otpSentAddress: _phoneNumberController.text,
  //         promptTitle: 'OTP sent to',
  //         screenTitle: 'Login using Mobile Number',
  //         buttonText: 'Submit',
  //         onButtonPressed: (context1, enteredOtps) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => UploadProfilePicBloc(), child: const MyJatya())),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}
