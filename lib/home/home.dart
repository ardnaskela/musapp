import 'package:flutter/material.dart';
import 'package:musapp/routes/routes.dart';
import 'package:musapp/services/auth.dart';
import 'package:musapp/services/firestore.dart';
import 'package:musapp/shared/error.dart';
import 'package:musapp/shared/loading.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasData) {
            return ChangeNotifierProvider(
              create: (_) => FirestoreService()..fetchMuseum(),
              child: Consumer<FirestoreService>(
                  builder: (context, provider, child) {
                {
                  return provider.isLoading
                      ? const LoadingScreen()
                      : const RoutesScreen();
                }
              }),
            );
          } else {
            return const ErrorScreen(
                message: "Errore di connessione, riprovaci più tardi");
          }
        });
  }
}
