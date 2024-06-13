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
    apiKey: 'AIzaSyDy_5OPWwYcBYsR4-NYZUJZAHMsRsgMu7k',
    appId: '1:777309420549:web:f87529b8a6cc0fb223b06c',
    messagingSenderId: '777309420549',
    projectId: 'brew-crew-a039e',
    authDomain: 'brew-crew-a039e.firebaseapp.com',
    storageBucket: 'brew-crew-a039e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPZgwZYN29haAR-KxoM5KS4RzGgUd2C18',
    appId: '1:777309420549:android:bb19efd169084b2423b06c',
    messagingSenderId: '777309420549',
    projectId: 'brew-crew-a039e',
    storageBucket: 'brew-crew-a039e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1KHpNsxDjcQd-COcYkA-92Yy9cCmQtSE',
    appId: '1:777309420549:ios:3ee606d7c9a1b49823b06c',
    messagingSenderId: '777309420549',
    projectId: 'brew-crew-a039e',
    storageBucket: 'brew-crew-a039e.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1KHpNsxDjcQd-COcYkA-92Yy9cCmQtSE',
    appId: '1:777309420549:ios:63580e2f4ff406d423b06c',
    messagingSenderId: '777309420549',
    projectId: 'brew-crew-a039e',
    storageBucket: 'brew-crew-a039e.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}