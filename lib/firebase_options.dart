// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBAXvKvcdyv0d2LT_LBNltl9x0_OGosIII',
    appId: '1:550462052734:web:6da884ddd321b5b8ddfb2f',
    messagingSenderId: '550462052734',
    projectId: 'tn-3eea9',
    authDomain: 'tn-3eea9.firebaseapp.com',
    storageBucket: 'tn-3eea9.appspot.com',
    measurementId: 'G-5XVKCV7SL5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3tppV7exD67LPsY87qjK0VlNiGTb0Vg0',
    appId: '1:550462052734:android:35da28f8f0129780ddfb2f',
    messagingSenderId: '550462052734',
    projectId: 'tn-3eea9',
    storageBucket: 'tn-3eea9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9OBBm-DlqPzItjKEXB8PG-Ke7wm7CDqk',
    appId: '1:550462052734:ios:d71d169574bc120bddfb2f',
    messagingSenderId: '550462052734',
    projectId: 'tn-3eea9',
    storageBucket: 'tn-3eea9.appspot.com',
    iosClientId: '550462052734-ma553cr2mik6c7cqhjjnhnfrlqcfj14n.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9OBBm-DlqPzItjKEXB8PG-Ke7wm7CDqk',
    appId: '1:550462052734:ios:d71d169574bc120bddfb2f',
    messagingSenderId: '550462052734',
    projectId: 'tn-3eea9',
    storageBucket: 'tn-3eea9.appspot.com',
    iosClientId: '550462052734-ma553cr2mik6c7cqhjjnhnfrlqcfj14n.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDelivery',
  );
}
