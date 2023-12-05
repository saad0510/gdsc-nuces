import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/providers.dart';
import '../entities/club.dart';

class ClubRepo {
  final FirebaseFirestore firestore;

  ClubRepo({
    required this.firestore,
  });

  late final clubsCollection = firestore
      .collection('clubs') //
      .withConverter(
        fromFirestore: (doc, _) => Club.fromMap(doc.data()!),
        toFirestore: (club, _) => throw UnimplementedError(),
      );

  Stream<List<Club>> clubsStream() {
    return clubsCollection.snapshots().map(
      (event) {
        return event.docs
            .map((doc) => doc.data()) //
            .toList();
      },
    );
  }
}

final clubRepoProvider = Provider(
  (ref) => ClubRepo(
    firestore: ref.read(firestoreProvider),
  ),
);
