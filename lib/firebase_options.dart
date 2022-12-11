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
    apiKey: 'AIzaSyAH-AyYh1VEE9_qiE5g0lqd-_H9MTBN99o',
    appId: '1:289582591982:web:978e17578d2ef8708f28ff',
    messagingSenderId: '289582591982',
    projectId: 'central-de-eventos-4ec91',
    authDomain: 'central-de-eventos-4ec91.firebaseapp.com',
    storageBucket: 'central-de-eventos-4ec91.appspot.com',
    measurementId: 'G-J55RHNGGVW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbUZtvY_O9QgRN22XYlVdkeyT6e3n5CLU',
    appId: '1:289582591982:android:b0ebf336b95161de8f28ff',
    messagingSenderId: '289582591982',
    projectId: 'central-de-eventos-4ec91',
    storageBucket: 'central-de-eventos-4ec91.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWYvasYEGiRmD3fFoXw0IAnBGvcsmvkds',
    appId: '1:289582591982:ios:0f4795b5998441f38f28ff',
    messagingSenderId: '289582591982',
    projectId: 'central-de-eventos-4ec91',
    storageBucket: 'central-de-eventos-4ec91.appspot.com',
    iosClientId: '289582591982-f52t9734oarg2rsi7htpism88rn97f8a.apps.googleusercontent.com',
    iosBundleId: 'com.example.centralDeEventos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWYvasYEGiRmD3fFoXw0IAnBGvcsmvkds',
    appId: '1:289582591982:ios:0f4795b5998441f38f28ff',
    messagingSenderId: '289582591982',
    projectId: 'central-de-eventos-4ec91',
    storageBucket: 'central-de-eventos-4ec91.appspot.com',
    iosClientId: '289582591982-f52t9734oarg2rsi7htpism88rn97f8a.apps.googleusercontent.com',
    iosBundleId: 'com.example.centralDeEventos',
  );
}