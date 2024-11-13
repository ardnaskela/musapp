import 'package:flutter/material.dart';

const defaultError = 'Qualcosa è andato storto';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({super.key, this.message = defaultError});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorMessage(message: message),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, this.message = defaultError});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
