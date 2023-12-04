import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class InfoChip extends StatelessWidget {
  const InfoChip({
    super.key,
    required this.icon,
    required this.title,
    this.value,
  });

  final IconData icon;
  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.grey.shade200,
      avatar: Icon(icon, color: Colors.black),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          if (value != null) ...[
            AppSizes.tinyX,
            AppSizes.tinyX,
            Text(value!),
          ]
        ],
      ),
    );
  }
}
