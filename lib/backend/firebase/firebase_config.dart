import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDARbZ9eaCZTD6VFSaqtRp1XqhXNA-2Bf4",
            authDomain: "rackham-gsuufd.firebaseapp.com",
            projectId: "rackham-gsuufd",
            storageBucket: "rackham-gsuufd.firebasestorage.app",
            messagingSenderId: "241821836264",
            appId: "1:241821836264:web:140ab85d6f998c6eb63a5d"));
  } else {
    await Firebase.initializeApp();
  }
}
