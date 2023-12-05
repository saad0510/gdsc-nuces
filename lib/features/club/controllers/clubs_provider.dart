import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/constants.dart';
import '../entities/club.dart';
import '../entities/club_levels.dart';
import '../entities/club_team.dart';
import '../entities/club_user.dart';

const _names = ['App Development', 'Web Development', 'Cyber Security'];
const _description =
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus, sequi suscipit quisquam quos, quidem laboriosam alias earum, quas atque eius architecto. Rem aut distinctio repellat, vero molestias dolore sit laborum.';

final clubsProvider = Provider<List<Club>>(
  (ref) {
    final now = DateTime.now();
    final seed = now.microsecondsSinceEpoch;
    final random = Random(seed);
    final images = AppConstants.coverImages.toList();

    return List.generate(
      10,
      (i) => Club(
        id: 'club_$i',
        title: _names[i % 3],
        description: _description,
        coverImgUrl: images[i % 9],
        membersCount: random.nextInt(50) + 10,
        team: ClubTeam(
          lead: ClubUser(
            userId: 'leadUserId-$i',
            level: ClubLevels.lead,
          ),
          coleads: List.generate(
            random.nextInt(3),
            (j) => ClubUser(
              userId: '$i-coleadUserId-$j',
              level: ClubLevels.colead,
            ),
          ),
        ),
        createdAt: now,
      ),
    );
  },
);
