import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../auth/widgets/user_tile.dart';
import '../entities/club.dart';
import '../screens/club_team_screen.dart';
import 'label_tag.dart';

class ClubTeamCard extends StatelessWidget {
  const ClubTeamCard({
    super.key,
    required this.club,
  });

  final Club club;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Team',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () {
                context.pushTo(
                  ClubTeamScreen(club: club),
                );
              },
              child: const Text('View All'),
            ),
          ],
        ),
        AppSizes.tinyY,
        UserTile(
          userId: club.team.lead.userId,
          trailing: ClubLevelTag(club.team.lead.level),
        ),
      ],
    );
  }
}
