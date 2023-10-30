import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../app/assets.dart';
import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../firebase_options.dart';
import '../controllers/route_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    AppSizer.deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: OverflowBox(
          maxWidth: 2.dw,
          child: Lottie.asset(
            AppImages.appLogoAnimation,
            repeat: false,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final route = await Future.wait([
      ref.read(routeProvider.future),
      Future.delayed(const Duration(seconds: 4)),
    ]);
    if (context.mounted) //
      context.replaceAll(route.first);
  }
}
