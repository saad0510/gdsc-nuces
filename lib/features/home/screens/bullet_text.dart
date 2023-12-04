import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class BulletText extends StatelessWidget {
  const BulletText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.small.copyWith(left: 0),
          child: Icon(
            Icons.circle,
            size: 10.sp,
          ),
        ),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}
