import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/constants.dart';
import 'app/routes.dart';
import 'app/theme/theme.dart';
import 'core/utils/app_logger.dart';

void main() => runApp(const GdscApp());

class GdscApp extends StatelessWidget {
  const GdscApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [AppLogger()],
      child: Consumer(
        builder: (context, ref, _) {
          final brightness = ref.watch(themeModeProvider);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appTitle,
            theme: AppTheme().withBrightness(brightness),
            initialRoute: AppRoutes.initial.name,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
