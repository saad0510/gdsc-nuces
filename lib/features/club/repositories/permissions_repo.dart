import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controllers/auth_notifier.dart';
import '../entities/club.dart';
import '../entities/event.dart';

class PermissionsRepo {
  final Ref ref;

  const PermissionsRepo(this.ref);

  bool canAddEvents(Club club) {
    final user = ref.read(userProvider);
    final found = club.team.allUsers.where((u) => u.userId == user?.uid);
    return found.isNotEmpty;
  }

  bool canSeePendingEvents(Club club) => canAddEvents(club);

  bool canRegisterEvent(Event event) {
    final user = ref.read(userProvider);
    final found = event.members.where((u) => u.userId == user?.uid);
    return found.isEmpty;
  }

  bool canChangeMembers(Event event) {
    final user = ref.read(userProvider);
    final found = event.members.where((u) => u.userId == user?.uid);
    return found.isNotEmpty;
  }
}

final permissionsProvider = Provider<PermissionsRepo>(
  (ref) => PermissionsRepo(ref),
);
