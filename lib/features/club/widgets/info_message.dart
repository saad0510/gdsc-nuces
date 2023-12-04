import 'package:flutter/material.dart';

import '../../../app/assets.dart';
import '../../../app/sizer.dart';

class InfoMessage extends StatelessWidget {
  const InfoMessage({
    super.key,
    required this.title,
    required this.description,
    this.assetImage,
    this.icon,
  }) : assert(assetImage != null || icon != null);

  const InfoMessage.empty({
    super.key,
    required this.title,
    required this.description,
  })  : assetImage = AppImages.empty,
        icon = null;

  const InfoMessage.error({
    super.key,
    required this.title,
    required this.description,
  })  : assetImage = null,
        icon = const Icon(
          Icons.error,
          color: Colors.red,
        );

  final String title;
  final String description;
  final String? assetImage;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.6.dw,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Icon(
                  icon!.icon,
                  size: 100.sp,
                  color: icon!.color,
                )
              : Image.asset(
                  assetImage!,
                  height: 150.h,
                  fit: BoxFit.fitHeight,
                ),
          AppSizes.smallY,
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
