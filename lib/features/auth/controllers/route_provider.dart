import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/routes.dart';
import '../../../core/extensions/context_ext.dart';

final routeProvider = FutureProvider.autoDispose<AppRoutes>(
  (ref) async {
    return AppRoutes.auth;
    // final user = await ref.watch(authNotifierProvider.future);
    // if (user == null) return AppRoutes.login;
    // final profile = await ref.watch(profileNotifierProvider.future);
    // if (profile == null) return AppRoutes.completeProfile;
    // return AppRoutes.home;
  },
  name: 'route',
);

extension RouteExt on WidgetRef {
  void nextScreen({void Function()? beforePush}) async {
    final route = await read(routeProvider.future);
    if (beforePush != null) beforePush();
    if (context.mounted) context.replace(route);
  }
}
