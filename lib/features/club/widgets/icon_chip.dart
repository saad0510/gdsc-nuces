import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class IconChip extends StatelessWidget {
  const IconChip({
    super.key,
    required this.icon,
    required this.text,
    this.color,
  });

  final IconData icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 22.sp,
          color: color,
        ),
        AppSizes.tinyX,
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: color),
        ),
      ],
    );
  }
}
