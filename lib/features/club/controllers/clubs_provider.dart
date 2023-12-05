import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/club.dart';
import '../repositories/club_repo.dart';

final clubsProvider = StreamProvider<List<Club>>(
  (ref) => ref.watch(clubRepoProvider).clubsStream(),
);
