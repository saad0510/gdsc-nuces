import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../entities/event.dart';
import '../repositories/permissions_repo.dart';
import '../widgets/bullet_text.dart';
import '../widgets/event_members_view.dart';
import '../widgets/event_tile.dart';
import '../widgets/info_chip.dart';
import '../widgets/register_event_dialog.dart';

class EventDetailScreen extends ConsumerWidget {
  const EventDetailScreen({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canRegisterEvent = ref.watch(permissionsProvider).canRegisterEvent(event);

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EventTile(event: event),
            AppSizes.mediumY,
            Row(
              children: [
                InfoChip(
                  icon: Icons.lock_clock_outlined,
                  title: '${event.duration.inHours} Hrs',
                ),
                AppSizes.smallX,
                InfoChip(
                  icon: Icons.location_on,
                  title: event.venue,
                ),
              ],
            ),
            AppSizes.mediumY,
            Text(event.description),
            AppSizes.smallY,
            for (final point in event.summary) //
              BulletText(point),
            AppSizes.mediumY,
            EventMembersView(event: event),
          ],
        ),
      ),
      floatingActionButton: canRegisterEvent && event.approved
          ? FloatingActionButton(
              tooltip: 'Register',
              onPressed: () {
                RegisterEventDialog(event: event).show(context);
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
