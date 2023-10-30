import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/assets.dart';
import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../controllers/auth_notifier.dart';
import '../controllers/route_provider.dart';
import '../widgets/app_title.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.appLogo,
                  width: 0.3.dw,
                ),
                AppSizes.smallY,
                AppSizes.largeY,
                const AppTitle(),
              ],
            ),
          ),
          Positioned.fill(
            top: null,
            child: Padding(
              padding: AppPaddings.normal,
              child: ElevatedButton(
                onPressed: () => context.showLoadingUntil(
                  ref.read(authNotifierProvider.notifier).continueWithGoogle(),
                  then: (_) => ref.nextScreen(),
                ),
                child: const Text('Continue With Google'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
