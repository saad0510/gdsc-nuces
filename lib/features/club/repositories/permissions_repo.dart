import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controllers/auth_notifier.dart';
import '../entities/club.dart';

class PermissionsRepo {
  final Ref ref;

  const PermissionsRepo(this.ref);

  bool canAddEvents(Club club) {
    final user = ref.read(userProvider);
    final allowed = club.team.allUsers.where((u) => u.userId == user?.uid);
    return allowed.isNotEmpty;
  }
}

final permissionsProvider = Provider<PermissionsRepo>(
  (ref) => PermissionsRepo(ref),
);
