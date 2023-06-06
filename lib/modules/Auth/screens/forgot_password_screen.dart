import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/common_components/services/form_submission_status.dart';
import 'package:doc_connect/modules/Auth/screens/create_new_password_screen.dart';
import 'package:doc_connect/modules/Auth/screens/enter_otp_screen.dart';
import 'package:doc_connect/modules/Auth/screens/login_screen.dart';
import 'package:doc_connect/modules/Auth/widgets/custom_elevated_button.dart';
import 'package:doc_connect/modules/Auth/widgets/custom_text_button.dart';
import 'package:doc_connect/modules/Auth/widgets/icon_title_widget.dart';
import 'package:doc_connect/modules/Auth/widgets/input_text_field.dart';
import 'package:doc_connect/modules/Auth/widgets/phone_number_textfield.dart';

import '../../../common_components/widgets/popup_widget.dart';
import '../bloc/forgot_password_bloc/forgot_password_bloc.dart';
import '../services/auth_repository.dart';
import '../../../common_components/widgets/error_alert_dialog.dart';
import '../services/validators.dart';
import '../widgets/terms_and_copyright_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController(text: '');
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) =>
            ForgotPasswordBloc(authRepository: context.read<AuthRepository>()),
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            log(state.toString());
            if (state.formStatus is FormSubmissionFailed) {
              final FormSubmissionFailed formStatus =
                  state.formStatus as FormSubmissionFailed;
              showPopup(
                  context: context,
                  child: ErrorAlertDialog(
                    error: formStatus.exception.toString(),
                  ));
              context
                  .read<ForgotPasswordBloc>()
                  .add(const ForgotPasswordReinital());
              return;
            }
            if (state is ForgotPasswordSuccess) {
              final ForgotPasswordSuccess response = state;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnterOTPScreen(
                    otpSentAddress: _phoneNumberTextController.text.isEmpty
                        ? _emailTextController.text
                        : _phoneNumberTextController.text,
                    promptTitle: 'Verification code sent to',
                    screenTitle: 'Reset your password',
                    buttonText: 'Verify',
                    onButtonPressed: (context1, String enteredOtp) async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateNewPasswordScreen(
                            otp: enteredOtp,
                            validationId: response.validationId,
                          ),
                        ),
                      );
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
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      ...buildIconAndTitle(
                        titleText: 'Reset your Password',
                        height: height * 0.2,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      // BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                      //   builder: (context, state) {
                      //     return InputTextField(
                      //       labelText: 'Name',
                      //       hintText: 'Name',
                      //       validator: (name) => Validators.nameValidator(name),
                      //       onChanged: (value) => context.read<ForgotPasswordBloc>().add(NameChanged(name: value)),
                      //     );
                      //   },
                      // ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                        builder: (context, state) {
                          return InputTextField(
                            labelText: 'EMAIL ID',
                            textEditingController: _emailTextController,
                            hintText: 'Email ID',
                            validator: (email) =>
                                Validators.forgotPasswordEmailValidator(
                                    email, _phoneNumberTextController.text),
                            onChanged: (value) => context
                                .read<ForgotPasswordBloc>()
                                .add(EmailChanged(email: value)),
                          );
                        },
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const Text('or'),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          const PhoneNumberDropdownMenu(),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SizedBox(
                              width: width * 0.65,
                              child: TextFormField(
                                  controller: _phoneNumberTextController,
                                  decoration: const InputDecoration(
                                    hintText: 'Phone Number',
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (phone) =>
                                      Validators.forgotPasswordPhoneValidator(
                                          phone, _emailTextController.text)
                                  // inputFormatters: <TextInputFormatter>[
                                  //   FilteringTextInputFormatter.digitsOnly
                                  // ], // Only numbers can be entered
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                        builder: (context, state) {
                          return state.formStatus is FormSubmitting
                              ? const CircularProgressIndicator()
                              : CustomElevatedButton(
                                  onPressed: () {
                                    if (_phoneNumberTextController
                                                .text.length ==
                                            10 &&
                                        _emailTextController.text == "") {
                                      context
                                          .read<ForgotPasswordBloc>()
                                          .add(const ForgotPasswordSubmitted());
                                    }
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      context
                                          .read<ForgotPasswordBloc>()
                                          .add(const ForgotPasswordSubmitted());
                                    }
                                  },
                                  horizontalWidth: width * 0.25,
                                  verticalWidth: 12,
                                  text: 'Send Verification Code',
                                );
                        },
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        text: 'Back to Login',
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                      SizedBox(
                        height: height * 0.25,
                      ),
                      ...buildTermsAndCopyrightWidget(
                        termsOnPressed: () {},
                        privacyOnPressed: () {},
                        cookieOnPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
