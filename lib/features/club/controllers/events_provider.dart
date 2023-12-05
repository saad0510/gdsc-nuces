import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/event.dart';
import '../repositories/event_repo.dart';

final eventsProvider = StreamProvider.family<List<Event>, String>(
  (ref, clubId) => ref.read(eventRepoProvider).eventsStream(clubId),
);
