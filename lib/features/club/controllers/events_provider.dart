import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/event.dart';
import '../repositories/event_repo.dart';

final eventsProvider = StreamProvider.family<List<Event>, String>(
  (ref, clubId) => ref.watch(eventRepoProvider).eventsStream(clubId),
);

final approvedEventsProvider = Provider.family<AsyncValue<List<Event>>, String>(
  (ref, clubId) {
    final events = ref.watch(eventsProvider(clubId));
    return events.map(
      data: (events) {
        final allEvents = events.valueOrNull ?? const [];
        final approvedEvents = allEvents.where((e) => e.approved);
        return AsyncData(approvedEvents.toList());
      },
      error: (error) => error,
      loading: (loading) => loading,
    );
  },
);

final pendingEventsProvider = Provider.family<AsyncValue<List<Event>>, String>(
  (ref, clubId) {
    final events = ref.watch(eventsProvider(clubId));
    return events.map(
      data: (events) {
        final allEvents = events.valueOrNull ?? const [];
        final pendingEvents = allEvents.where((e) => !e.approved);
        return AsyncData(pendingEvents.toList());
      },
      error: (error) => error,
      loading: (loading) => loading,
    );
  },
);
