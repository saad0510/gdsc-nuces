import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/user_data.dart';
import '../repositories/user_repo.dart';

final getUserProvider = FutureProvider.autoDispose.family<UserData, String>(
  (ref, userId) => ref.read(userRepoProvider).getUser(userId),
);
