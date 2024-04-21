// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyApt2McnrBaP3iSD4m8P1Y-U23j1MhbGmM',
    appId: '1:34714086604:web:bddcf99cf0f181bcaf6669',
    messagingSenderId: '34714086604',
    projectId: 'justice-line',
    authDomain: 'justice-line.firebaseapp.com',
    storageBucket: 'justice-line.appspot.com',
    measurementId: 'G-CT7DH0H5C1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADxQiPA3t-c6aOhoaN_PdKSgQdxhJFjJ4',
    appId: '1:34714086604:android:a4d3bb55c28539f3af6669',
    messagingSenderId: '34714086604',
    projectId: 'justice-line',
    storageBucket: 'justice-line.appspot.com',
  );
}
