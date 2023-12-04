import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sizer.dart';
import 'colors.dart';
import 'ui_overlays.dart';

class AppTheme {
  final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      systemOverlayStyle: AppUiOverlays.lightOverlay,
    ),
  );

  final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppColors.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.dark,
      foregroundColor: Colors.white,
      systemOverlayStyle: AppUiOverlays.darkOverlay,
    ),
  );

  ThemeData withBrightness(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final theme = isDark ? darkTheme : lightTheme;
    final textTheme = this.textTheme.merge(theme.textTheme);

    return theme.copyWith(
      textTheme: textTheme,
      inputDecorationTheme: inputTheme,
      elevatedButtonTheme: elevatedButton,
      listTileTheme: listTile,
    );
  }

  final textTheme = Typography.englishLike2021.apply(
    fontSizeDelta: 1.sp,
    fontFamilyFallback: ['Google'],
  );

  final inputTheme = const InputDecorationTheme(
    filled: true,
    isDense: true,
    errorMaxLines: 3,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(0, 60.h),
      backgroundColor: AppColors.red,
      foregroundColor: Colors.white,
      shape: roundBox,
    ),
  );

  final listTile = ListTileThemeData(
    contentPadding: AppPaddings.small,
    shape: roundBox,
  );

  static const roundBox = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
}

final themeModeProvider = StateProvider<Brightness>((ref) => Brightness.light);
