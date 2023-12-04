import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/datetime_ext.dart';
import '../entities/club.dart';
import '../widgets/club_team_card.dart';
import '../widgets/club_tile.dart';
import '../widgets/event_list_view.dart';
import '../widgets/info_chip.dart';

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
            Wrap(
              spacing: 15.sp,
              children: [
                InfoChip(
                  icon: Icons.group,
                  title: 'Members',
                  value: club.membersCount.toString(),
                ),
                InfoChip(
                  icon: Icons.calendar_month,
                  title: club.createdAt.dateFormatedLong,
                ),
              ],
            ),
            AppSizes.smallY,
            Text(club.description),
            AppSizes.smallY,
            ClubTeamCard(club: club),
            AppSizes.normalY,
            EventListView(club: club),
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
