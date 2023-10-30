import 'dart:math' show min;

import 'package:flutter/material.dart';

class AppSizer {
  static const designSize = Size(456, 987);

  static Size deviceSize = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  const AppSizer._internal();

  static const instance = AppSizer._internal();

  double get scaleWidth => deviceSize.width / designSize.width;

  double get scaleHeight => deviceSize.height / designSize.height;

  double get scaleText => min(scaleWidth, scaleHeight);

  double setWidth(num width) => width * scaleWidth;

  double setHeight(num height) => height * scaleHeight;

  double setSp(num fontSize) => fontSize * scaleText;
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
}

class AppSizes {
  static final tinyX = SizedBox(width: 6.w);
  static final tinyY = SizedBox(height: 6.h);

  static final smallX = SizedBox(width: 12.w);
  static final smallY = SizedBox(height: 12.h);

  static final normalX = SizedBox(width: 20.w);
  static final normalY = SizedBox(height: 20.h);

  static final largeX = SizedBox(width: 35.w);
  static final largeY = SizedBox(height: 35.h);
}
