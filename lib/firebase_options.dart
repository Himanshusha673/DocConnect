import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzGms5vk8YLo5ooDM9HOP3fEH055aggFo',
    appId: '1:17274511755:android:298f454012b4f509488f8e',
    messagingSenderId: '17274511755',
    projectId: 'jatya-patient',
    storageBucket: 'jatya-patient.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFzpmOJyXZ6NtOjW1DTM51EYXvrF1CFJM',
    appId: '1:17274511755:ios:f95e90d22d6ddb40488f8e',
    messagingSenderId: '17274511755',
    projectId: 'jatya-patient',
    storageBucket: 'jatya-patient.appspot.com',
    androidClientId:
        '17274511755-mg53b86tku18b7upd14r0r9av33256k8.apps.googleusercontent.com',
    iosClientId:
        '17274511755-82mtj1a7fkk475di5eo9oh32kgtvt4vd.apps.googleusercontent.com',
    iosBundleId: 'com.jatya.patient',
  );
}
