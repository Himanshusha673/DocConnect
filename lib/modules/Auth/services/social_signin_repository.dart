import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jatya_patient_mobile/utils/constants/keys_konstants.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';

class SocialMediaSignInRepository {
  Future<dynamic> googleSignIn() async {
    // Initiate the auth procedure
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // fetch the auth details from the request made earlier
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // Create a new credential for signing in with google
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        // Once signed in, return the UserCredential
        final idToken = await userCredential.user!.getIdToken();
        log('IDToken $idToken');
        return userCredential.credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          return 'Account exists with different credential';
        } else if (e.code == 'invalid-credential') {
          return 'Invalid credential';
        }
      } catch (e) {
        return e.toString();
      }
    }
  }

  Future<dynamic> twitterSignIn() async {
    // Initiate the auth procedure
    final twitterLogin = TwitterLogin(
        apiKey: KeysConstants.twitterApiKey,
        apiSecretKey: KeysConstants.twitterApiSecretKey,
        redirectURI: "flutter-twitter-login://");
    final loginResp = await twitterLogin.login();
    if (loginResp.authToken != null) {
      final twitterAuthCred = TwitterAuthProvider.credential(
          accessToken: loginResp.authToken!,
          secret: loginResp.authTokenSecret!);
      try {
        final user =
            await FirebaseAuth.instance.signInWithCredential(twitterAuthCred);
        final idToken = await user.user!.getIdToken();
        log('IDToken $idToken');
        return user.credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          return 'Account exists with different credential';
        } else if (e.code == 'invalid-credential') {
          return 'Invalid credential';
        }
      } catch (e) {
        return e.toString();
      }
    }
  }

  Future<dynamic> appleSignIn() async {
    // Initiate the auth procedure
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    if (credential.identityToken != null) {
      final oAuthProvider = OAuthProvider('apple.com');
      final firebaseCredential = oAuthProvider.credential(
        idToken: credential.identityToken!,
        accessToken: credential.authorizationCode,
      );
      try {
        final user = await FirebaseAuth.instance
            .signInWithCredential(firebaseCredential);
        final idToken = await user.user!.getIdToken();
        log('IDToken $idToken');
        log('$user');
        return user.credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          return 'Account exists with different credential';
        } else if (e.code == 'invalid-credential') {
          return 'Invalid credential';
        }
      } catch (e) {
        return e.toString();
      }
    }
  }

  Future<dynamic> facebookSignIn() async {
    // Initiate the auth procedure
    LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      if (result.accessToken != null) {
        // if weare receiving token then we are signing in the user to firebase and returning that firebase token further
        final credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        try {
          final user =
              await FirebaseAuth.instance.signInWithCredential(credential);
          final idToken = await user.user!.getIdToken();
          log('IDToken $idToken');
          return user.credential;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            return 'Account exists with different credential';
          } else if (e.code == 'invalid-credential') {
            return 'Invalid credential';
          }
        } catch (e) {
          return e.toString();
        }
      } else {
        return result.message.toString();
      }
    }
  }

  // Future<dynamic> signInWithLinkedIn() async {
  //   // Create a new OAuth provider for LinkedIn
  //   final provider = OAuthProvider('linkedin.com');
  //   // Set the OAuth scopes you want to request from the user
  //   provider.addScope('r_liteprofile');
  //   provider.addScope('r_emailaddress');
  //   // Use the flutter_web_auth package to launch the LinkedIn authentication flow
  //   final result = await FlutterWebAuth.authenticate(
  //     url: provider.buildUrl(),
  //     callbackUrlScheme:
  //         'flutter-firebase-auth', // Replace with your app scheme
  //   );
  //   // Once the user has authenticated with LinkedIn, retrieve their Firebase credential
  //   final credential = provider.credentialFromResponseUri(result);
  //   // Use the Firebase Auth API to sign in the user
  //   final authResult =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   return authResult;
  // }
}
