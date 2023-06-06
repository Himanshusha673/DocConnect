import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/modules/Auth/services/social_signin_repository.dart';
import 'package:jatya_patient_mobile/modules/Auth/widgets/social_media_login_button.dart';

import '../../../common_components/widgets/error_alert_dialog.dart';
import '../../../utils/constants/image_konstants.dart';
import '../../online_consultation/widgets/start_consultation_alert.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: Platform.isIOS
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      children: [
        SocialMediaLoginButton(
          iconImage: ImagesConstants.facebook,
          onPressed: () async {
            SocialMediaSignInRepository repoObj = SocialMediaSignInRepository();
            final resp = await repoObj.facebookSignIn();
            if (resp.runtimeType == AuthCredential) {
              log('$resp');
            } else if (resp != null) {
              if (context.mounted) {
                showPopup(
                  context: context,
                  child: ErrorAlertDialog(error: resp.toString()),
                );
              }
            }
            // TODO: Send token from resp to Backend
          },
        ),
        SocialMediaLoginButton(
          iconImage: ImagesConstants.google,
          onPressed: () async {
            SocialMediaSignInRepository repoObj = SocialMediaSignInRepository();
            final resp = await repoObj.googleSignIn();
            if (resp.runtimeType == AuthCredential) {
              log('$resp');
            } else if (resp != null) {
              if (context.mounted) {
                showPopup(
                  context: context,
                  child: ErrorAlertDialog(error: resp.toString()),
                );
              }
            }

            // AuthRepository().socialMediaLogin(url: ApiConstants.googleLogin);
            // TODO: Send token from resp to Backend
          },
        ),
        Platform.isIOS
            ? SocialMediaLoginButton(
                iconImage: ImagesConstants.apple,
                onPressed: () async {
                  SocialMediaSignInRepository repoObj =
                      SocialMediaSignInRepository();
                  final resp = await repoObj.appleSignIn();
                  if (resp.runtimeType == AuthCredential) {
                    log('$resp');
                  } else if (resp != null) {
                    if (context.mounted) {
                      showPopup(
                        context: context,
                        child: ErrorAlertDialog(error: resp.toString()),
                      );
                    }
                  }
                  // TODO: Send token from resp to Backend
                },
              )
            : Container(),
        SocialMediaLoginButton(
          iconImage: ImagesConstants.linkedin,
          onPressed: () async {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute<void>(
            //       builder: (BuildContext context) => LinkedInUserWidget(
            //             redirectUrl:
            //                 "https://jatya-patient.firebaseapp.com/__/auth/handler",
            //             clientId: "780fgkh9h0eyot",
            //             clientSecret: "fEJkirYcI3ljxIqM",
            //             onGetUserProfile:
            //                 (UserSucceededAction linkedInUser) async {
            //               print(
            //                   'Access token ${linkedInUser.user.token.accessToken}');
            //               log('${linkedInUser.user.userId}');
            //               final oAuthProvider = OAuthProvider('oidc.linkedin');
            //               final firebaseCredential = oAuthProvider.credential(
            //                   accessToken: linkedInUser.user.token.accessToken,
            //                   idToken: linkedInUser.user.userId);
            //               try {
            //                 final user = await FirebaseAuth.instance
            //                     .signInWithCredential(firebaseCredential);

            //                 log('SIUUU LINKEDIN $user');
            //                 Navigator.pop(context);
            //               } on FirebaseAuthException catch (e) {
            //                 print(e);
            //                 if (e.code ==
            //                     'account-exists-with-different-credential') {
            //                   print('account-exists-with-different-credential');
            //                   Navigator.pop(context);
            //                 } else if (e.code == 'invalid-credential') {
            //                   print('invalid-credential');
            //                   Navigator.pop(context);
            //                 }
            //               } catch (e) {
            //                 print(e);
            //                 Navigator.pop(context);
            //               }
            //             },
            //             onError: (UserFailedAction e) {
            //               print('Error: ${e.toString()}');
            //             },
            //           )

            //       // LinkedInAuthCodeWidget(
            //       //   redirectUrl:
            //       //       "https://jatya-patient.firebaseapp.com/__/auth/handler",
            //       //   clientId: "780fgkh9h0eyot",
            //       //   onGetAuthCode: (AuthorizationSucceededAction response) async {
            //       //     print('Auth code ${response.codeResponse.code}');
            //       //     print('State: ${response.codeResponse.state}');
            //       //     log('${response.codeResponse.accessToken}');
            //       //     Navigator.pop(context);
            //       //     final oAuthProvider = OAuthProvider('LinkedIn');
            //       //     final firebaseCredential = oAuthProvider.credential(
            //       //       accessToken:
            //       //           response.codeResponse.accessToken!.accessToken,
            //       //     );
            //       //     try {
            //       //       final user = await FirebaseAuth.instance
            //       //           .signInWithCredential(firebaseCredential);
            //       //       log('SIUUU LINKEDIN $user');
            //       //     } on FirebaseAuthException catch (e) {
            //       //       if (e.code ==
            //       //           'account-exists-with-different-credential') {
            //       //         print('account-exists-with-different-credential');
            //       //         Navigator.pop(context);
            //       //       } else if (e.code == 'invalid-credential') {
            //       //         print('invalid-credential');
            //       //         Navigator.pop(context);
            //       //       }
            //       //     } catch (e) {
            //       //       print(e);
            //       //       Navigator.pop(context);
            //       //     }
            //       //   },
            //       //   onError: (AuthorizationFailedAction e) {
            //       //     print('Error: ${e.toString()}');
            //       //   },
            //       // ),
            //       ),
            // );

            // TODO: Add linkedin login
          },
        ),
        SocialMediaLoginButton(
          iconImage: ImagesConstants.twitter,
          onPressed: () async {
            SocialMediaSignInRepository repoObj = SocialMediaSignInRepository();
            final resp = await repoObj.twitterSignIn();
            if (resp.runtimeType == AuthCredential) {
              log('$resp');
            } else if (resp != null) {
              if (context.mounted) {
                showPopup(
                  context: context,
                  child: ErrorAlertDialog(error: resp.toString()),
                );
              }
            }

            // TODO: Send token from resp to Backend
          },
        ),
      ],
    );
  }
}
