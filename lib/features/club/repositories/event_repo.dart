import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/providers.dart';
import '../entities/event.dart';

class EventRepo {
  final FirebaseFirestore firestore;

  EventRepo({
    required this.firestore,
  });

  late final eventsCollection = firestore
      .collection('events') //
      .withConverter(
        fromFirestore: (doc, _) => Event.fromMap(doc.data()!),
        toFirestore: (event, _) => event.toMap(),
      );

  Stream<List<Event>> eventsStream(String clubId) {
    return eventsCollection.snapshots().map(
          (ev) => ev.docs.map((d) => d.data()).toList(),
        );
  }

  Future<void> addEvent(Event event) async {
    final doc = eventsCollection.doc();
    event = event.copyWith(id: doc.id);
    await doc.set(event);
  }

  Future<void> updateEvent(Event event) async {
    await eventsCollection.doc(event.id).set(event);
  }

  Future<void> deleteEvent(Event event) async {
    await eventsCollection.doc(event.id).delete();
  }
}

final eventRepoProvider = Provider(
  (ref) => EventRepo(
    firestore: ref.read(firestoreProvider),
  ),
);
