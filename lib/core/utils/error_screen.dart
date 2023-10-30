import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../app/sizer.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error});

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              heightFactor: 2,
              child: Icon(
                Icons.error_rounded,
                size: 70.sp,
                color: Colors.red,
              ),
            ),
            Text(
              'Error',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            AppSizes.largeY,
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  String get message {
    final error = this.error;
    if (error is FirebaseException)
      return error.message ?? 'No Message';
    else
      return error.toString();
  }
}
