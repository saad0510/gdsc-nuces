import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../app/theme/colors.dart';
import '../../../core/extensions/context_ext.dart';
import '../controllers/events_provider.dart';
import '../entities/club.dart';
import '../repositories/permissions_repo.dart';
import '../widgets/club_team_card.dart';
import '../widgets/club_tile.dart';
import '../widgets/event_list_view.dart';
import '../widgets/join_club_dialog.dart';
import 'add_event_screen.dart';

class ClubDetailScreen extends ConsumerWidget {
  const ClubDetailScreen({super.key, required this.club});

  final Club club;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canAddEvents = ref.watch(permissionsProvider).canAddEvents(club);
    final canSeePendingEvents = ref.watch(permissionsProvider).canSeePendingEvents(club);

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
            EventListView(
              title: 'Club Events',
              events: ref.watch(approvedEventsProvider(club.id)),
            ),
            if (canSeePendingEvents) ...[
              AppSizes.mediumY,
              const Divider(),
              AppSizes.mediumY,
              EventListView(
                title: 'Pending Events',
                showEmpty: false,
                events: ref.watch(pendingEventsProvider(club.id)),
              ),
            ],
            AppSizes.largeY,
            AppSizes.largeY,
          ],
        ),
      ),
      floatingActionButton: !canAddEvents
          ? null
          : FloatingActionButton(
              tooltip: 'Join',
              onPressed: () {
                context.pushTo(
                  AddEventScreen(clubId: club.id),
                );
              },
              child: const Icon(Icons.add),
            ),
      bottomSheet: const Divider(height: 0),
      bottomNavigationBar: canAddEvents
          ? null
          : Padding(
              padding: AppPaddings.normal,
              child: ElevatedButton(
                onPressed: () {
                  JoinClubForm(club: club).show(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue),
                child: const Text('Join'),
              ),
            ),
    );
  }
}
