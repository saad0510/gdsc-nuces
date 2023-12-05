import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../entities/event.dart';
import '../widgets/event_tile.dart';
import '../widgets/info_chip.dart';
import '../widgets/register_event_dialog.dart';
import '../widgets/bullet_text.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
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
            const Divider(),
            AppSizes.mediumY,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Register',
        onPressed: () {
          RegisterEventDialog(event: event).show(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
