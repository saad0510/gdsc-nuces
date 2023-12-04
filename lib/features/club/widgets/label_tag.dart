import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class LabelTag extends StatelessWidget {
  const LabelTag({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.tiny,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: AppPaddings.tinyX,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
