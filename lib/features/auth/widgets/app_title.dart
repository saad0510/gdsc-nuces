import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app_title',
      child: Text(
        'Google Developer\nStudent Clubs',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              height: 1.5,
              color: Colors.grey.shade600,
            ),
      ),
    );
  }
}
