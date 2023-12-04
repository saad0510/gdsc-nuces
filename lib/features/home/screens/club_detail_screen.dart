import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/datetime_ext.dart';
import '../entities/club.dart';
import '../widgets/club_tile.dart';
import '../widgets/info_chip.dart';

class ClubDetailScreen extends StatelessWidget {
  const ClubDetailScreen({super.key, required this.club});

  final Club club;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSizes.normalY,
            ClubTile(club: club),
            AppSizes.normalY,
            Wrap(
              spacing: 15.sp,
              children: [
                InfoChip(
                  icon: Icons.group,
                  title: 'Members',
                  value: club.membersCount.toString(),
                ),
                InfoChip(
                  icon: Icons.alarm,
                  title: club.createdAt.dateFormatedLong,
                ),
              ],
            ),
            AppSizes.smallY,
            Text(club.description),
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
