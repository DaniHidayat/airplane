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
    apiKey: 'AIzaSyCORTKwPoj2N1R2K4UYjphJOavZtodByU0',
    appId: '1:149484894969:web:04aa416991ad0935aec028',
    messagingSenderId: '149484894969',
    projectId: 'airplane-9ef17',
    authDomain: 'airplane-9ef17.firebaseapp.com',
    storageBucket: 'airplane-9ef17.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvLKVKAnIAD1I28odc0U_hy4cRvwnrdX4',
    appId: '1:149484894969:android:b8f9d183b523d73aaec028',
    messagingSenderId: '149484894969',
    projectId: 'airplane-9ef17',
    storageBucket: 'airplane-9ef17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUkeEorl8dO2VxO7S5fRa8LF6eX97IVlY',
    appId: '1:149484894969:ios:eab439f93f1b36b5aec028',
    messagingSenderId: '149484894969',
    projectId: 'airplane-9ef17',
    storageBucket: 'airplane-9ef17.appspot.com',
    iosClientId: '149484894969-0cjqgmdt1h0m0shp79mpgg8ipmdmrktn.apps.googleusercontent.com',
    iosBundleId: 'com.danihdyt.airplane',
  );
}
