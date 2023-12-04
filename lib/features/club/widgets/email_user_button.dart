import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';

class EmailUserButton extends StatelessWidget {
  const EmailUserButton(this.email, {super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      color: AppColors.blue,
      icon: const Icon(Icons.email),
    );
  }
}
