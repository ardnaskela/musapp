import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musapp/routes.dart';
import 'package:musapp/services/auth.dart';
import 'package:musapp/theme.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: "env");

  await AuthService().signInAnonymously();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    {
      return MaterialApp(
        title: 'MusApp',
        theme: appTheme,
        routes: appRoutes,
      );
    }
  }
}
