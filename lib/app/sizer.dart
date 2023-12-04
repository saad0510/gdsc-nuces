import 'dart:math' show min;

import 'package:flutter/material.dart';

class AppSizer {
  static const designSize = Size(456, 987);

  static late final Size deviceSize;

  const AppSizer._internal();

  static const instance = AppSizer._internal();

  double get scaleWidth => deviceSize.width / designSize.width;

  double get scaleHeight => deviceSize.height / designSize.height;

  double get scaleText => min(scaleWidth, scaleHeight);

  double setWidth(num width) => width * scaleWidth;

  double setHeight(num height) => height * scaleHeight;

  double setSp(num fontSize) => fontSize * scaleText;

  static Future<void> ensureScreenSize() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    final window = binding.window;
    if (window.physicalGeometry.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 100));
      binding.deferFirstFrame();
      await ensureScreenSize();
      binding.allowFirstFrame();
    } else {
      deviceSize = window.physicalSize / window.devicePixelRatio;
    }
  }
}

extension AppSizerNumExt on num {
  double get w => AppSizer.instance.setWidth(this);

  double get h => AppSizer.instance.setHeight(this);

  double get sp => AppSizer.instance.setSp(this);

  double get dw => AppSizer.deviceSize.width * this;

  double get dh => AppSizer.deviceSize.height * this;
}

class AppPaddings {
  static final normal = EdgeInsets.all(20.sp);
  static final normalX = EdgeInsets.symmetric(horizontal: 20.sp);
  static final normalY = EdgeInsets.symmetric(vertical: 20.sp);

  static final small = EdgeInsets.all(12.sp);
  static final smallX = EdgeInsets.symmetric(horizontal: 12.sp);
  static final smallY = EdgeInsets.symmetric(vertical: 12.sp);

  static final tiny = EdgeInsets.all(5.sp);
  static final tinyX = EdgeInsets.symmetric(horizontal: 5.sp);
}

class AppSizes {
  static final tinyX = SizedBox(width: 6.w);
  static final tinyY = SizedBox(height: 6.h);

  static final smallX = SizedBox(width: 18.w);
  static final smallY = SizedBox(height: 18.h);

  static final mediumY = SizedBox(height: 24.h);

  static final normalX = SizedBox(width: 30.w);
  static final normalY = SizedBox(height: 30.h);

  static final largeX = SizedBox(width: 40.w);
  static final largeY = SizedBox(height: 40.h);
}
