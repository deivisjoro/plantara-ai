import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB8r8DisXQYMKsE-HUlX8ailJIG7kvwNc4",
            authDomain: "plantara-ai.firebaseapp.com",
            projectId: "plantara-ai",
            storageBucket: "plantara-ai.firebasestorage.app",
            messagingSenderId: "93651962085",
            appId: "1:93651962085:web:4981ae518448212bb82c0c",
            measurementId: "G-DHVJVE56LL"));
  } else {
    await Firebase.initializeApp();
  }
}
