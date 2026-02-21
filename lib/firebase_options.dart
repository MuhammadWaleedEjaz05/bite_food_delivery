

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
        return windows;
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
    apiKey: 'AIzaSyBl2MSFEVPSUboE0XwixNxPxTuvfg5NkbE',
    appId: '1:964243541876:web:f18c76c0c6e82ae749e621',
    messagingSenderId: '964243541876',
    projectId: 'bite-food-delivery-3b736',
    authDomain: 'bite-food-delivery-3b736.firebaseapp.com',
    storageBucket: 'bite-food-delivery-3b736.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCLW_uefys0sMd1rLiiG2ObxLOaUHD_o8',
    appId: '1:964243541876:android:16bad4fb5257f36249e621',
    messagingSenderId: '964243541876',
    projectId: 'bite-food-delivery-3b736',
    storageBucket: 'bite-food-delivery-3b736.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfPVA_Aih8dW51ct-ofHYT9FdGYfZqAcg',
    appId: '1:964243541876:ios:c224568b1614211549e621',
    messagingSenderId: '964243541876',
    projectId: 'bite-food-delivery-3b736',
    storageBucket: 'bite-food-delivery-3b736.firebasestorage.app',
    iosBundleId: 'com.example.biteFoodDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfPVA_Aih8dW51ct-ofHYT9FdGYfZqAcg',
    appId: '1:964243541876:ios:c224568b1614211549e621',
    messagingSenderId: '964243541876',
    projectId: 'bite-food-delivery-3b736',
    storageBucket: 'bite-food-delivery-3b736.firebasestorage.app',
    iosBundleId: 'com.example.biteFoodDelivery',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBl2MSFEVPSUboE0XwixNxPxTuvfg5NkbE',
    appId: '1:964243541876:web:6c1c7f3d1d7189be49e621',
    messagingSenderId: '964243541876',
    projectId: 'bite-food-delivery-3b736',
    authDomain: 'bite-food-delivery-3b736.firebaseapp.com',
    storageBucket: 'bite-food-delivery-3b736.firebasestorage.app',
  );
}
