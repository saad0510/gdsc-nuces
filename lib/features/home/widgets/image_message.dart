import 'package:flutter/material.dart';

import '../../../app/assets.dart';
import '../../../app/sizer.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({
    super.key,
    required this.title,
    required this.description,
    required this.assetImage,
  });

  const ImageMessage.empty({
    super.key,
    required this.title,
    required this.description,
  }) : assetImage = AppImages.empty;

  const ImageMessage.error({
    super.key,
    required this.title,
    required this.description,
  }) : assetImage = AppImages.error;

  final String title;
  final String description;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: 0.6.dw,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image.asset(
              assetImage,
              width: 0.3.dw,
              fit: BoxFit.contain,
            ),
          ),
          AppSizes.mediumY,
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          AppSizes.tinyY,
          Text(
            description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
