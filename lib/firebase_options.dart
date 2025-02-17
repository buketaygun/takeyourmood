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
    apiKey: 'AIzaSyDL9sPFcLgEMN2zC-tYq5k1y0blei5GfLA',
    appId: '1:439325499276:web:d9c07574947b4b74b800a9',
    messagingSenderId: '439325499276',
    projectId: 'takeurmood-e6e1d',
    authDomain: 'takeurmood-e6e1d.firebaseapp.com',
    databaseURL: 'https://takeurmood-e6e1d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'takeurmood-e6e1d.appspot.com',
    measurementId: 'G-6WD5ZH048C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAC_rG9lIvACyhfFS8kBY2D_lHIxa3R5o',
    appId: '1:439325499276:android:d20686129806ed89b800a9',
    messagingSenderId: '439325499276',
    projectId: 'takeurmood-e6e1d',
    databaseURL: 'https://takeurmood-e6e1d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'takeurmood-e6e1d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpNKC6DEBVJTYy5KiJonOxSl0Q6i2SkQg',
    appId: '1:439325499276:ios:9ff2728c031fa3cdb800a9',
    messagingSenderId: '439325499276',
    projectId: 'takeurmood-e6e1d',
    databaseURL: 'https://takeurmood-e6e1d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'takeurmood-e6e1d.appspot.com',
    iosClientId: '439325499276-a97au77mck4uvq24jh5jui9e5jvn2m91.apps.googleusercontent.com',
    iosBundleId: 'com.example.takeyourmood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpNKC6DEBVJTYy5KiJonOxSl0Q6i2SkQg',
    appId: '1:439325499276:ios:9ff2728c031fa3cdb800a9',
    messagingSenderId: '439325499276',
    projectId: 'takeurmood-e6e1d',
    databaseURL: 'https://takeurmood-e6e1d-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'takeurmood-e6e1d.appspot.com',
    iosClientId: '439325499276-a97au77mck4uvq24jh5jui9e5jvn2m91.apps.googleusercontent.com',
    iosBundleId: 'com.example.takeyourmood',
  );
}
