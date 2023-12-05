import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../auth/widgets/user_tile.dart';
import '../entities/club.dart';
import '../widgets/email_user_button.dart';

class ClubTeamScreen extends StatelessWidget {
  const ClubTeamScreen({
    super.key,
    required this.club,
  });

  final Club club;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(club.title),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Team Lead',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppSizes.smallY,
            UserTile(
              userId: club.team.lead.userId,
              trailingWithUser: (user) => EmailUserButton(user.email),
            ),
            AppSizes.normalY,
            if (club.team.coleads.isNotEmpty)
              Text(
                'Coleads',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            for (final colead in club.team.coleads) ...[
              AppSizes.smallY,
              UserTile(
                userId: colead.userId,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
