import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/errors.dart';
import '../../../core/utils/providers.dart';
import '../entities/user_data.dart';

class UserRepo {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  UserRepo({
    required this.firestore,
    required this.storage,
  });

  late final userCollection = firestore
      .collection('users') //
      .withConverter(
        fromFirestore: (doc, _) => UserData.fromMap(doc.data()!),
        toFirestore: (user, _) => user.toMap(),
      );

  late final userImages = storage.ref('profile_pics');

  Future<UserData> getUser(String uid) async {
    final user = await userCollection.doc(uid).get();
    final data = user.data();
    if (data == null) throw AppErrors.noUser;
    return data;
  }

  Future<List<UserData>> getUsers(List<String> uids) async {
    return Future.wait(uids.map(getUser));
  }

  Future<void> setUser(UserData user) async {
    await userCollection.doc(user.uid).set(user);
  }

  Future<String> uploadUserImage(String uid, File file) async {
    final task = await userImages.child(uid).putFile(file);
    return task.ref.getDownloadURL();
  }
}

final userRepoProvider = Provider(
  (ref) => UserRepo(
    firestore: ref.read(firestoreProvider),
    storage: ref.read(fireStorageProvider),
  ),
);
