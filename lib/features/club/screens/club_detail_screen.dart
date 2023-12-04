import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../entities/club.dart';
import '../widgets/club_team_card.dart';
import '../widgets/club_tile.dart';
import '../widgets/event_list_view.dart';

class ClubDetailScreen extends StatelessWidget {
  const ClubDetailScreen({super.key, required this.club});

  final Club club;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClubTile(club: club),
            AppSizes.mediumY,
            Text(club.description),
            AppSizes.mediumY,
            ClubTeamCard(club: club),
            AppSizes.mediumY,
            const Divider(),
            AppSizes.mediumY,
            EventListView(clubId: club.id),
            AppSizes.largeY,
            AppSizes.largeY,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Join',
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
