import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../app/constants.dart';
import '../../../core/utils/errors.dart';
import '../../../core/utils/providers.dart';
import '../entities/user_data.dart';

class AuthRepo {
  final FirebaseAuth auth;

  const AuthRepo({required this.auth});

  Future<UserData?> silentLogin() async {
    final user = auth.currentUser;
    if (user == null) return null;
    return userFromFirebase(user);
  }

  Future<UserData> continueWithGoogle() async {
    final googleSignin = GoogleSignIn(hostedDomain: AppConstants.emailDomain);
    final googleUser = await googleSignin.signIn();
    if (googleUser == null) throw AppErrors.ignore;

    final googleAuth = await googleUser.authentication;
    final googleTokens = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final credits = await auth.signInWithCredential(googleTokens);
    final user = credits.user!;
    return userFromFirebase(user);
  }

  Future<void> logout() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  UserData userFromFirebase(User user) {
    return UserData(
      name: user.displayName ?? '',
      email: user.email!,
      imageUrl: user.photoURL ?? '',
    );
  }
}

final authRepoProvider = Provider(
  (ref) => AuthRepo(
    auth: ref.read(fireAuthProvider),
  ),
);
