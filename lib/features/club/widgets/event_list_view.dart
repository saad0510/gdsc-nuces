import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../controllers/events_provider.dart';
import '../screens/event_detail_screen.dart';
import 'event_tile.dart';
import 'info_message.dart';

class EventListView extends ConsumerWidget {
  const EventListView({
    super.key,
    required this.clubId,
  });

  final String clubId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsProvider(clubId));

    if (eventsAsync.isLoading)
      return Text(
        'Loading Events',
        style: Theme.of(context).textTheme.titleMedium,
      );

    if (eventsAsync.hasError)
      return Center(
        heightFactor: 1.5,
        child: InfoMessage.error(
          title: 'An error occured',
          description: eventsAsync.error.toString(),
        ),
      );

    final events = eventsAsync.value!;

    if (events.isEmpty)
      return const Center(
        heightFactor: 1.5,
        child: InfoMessage.empty(
          title: 'No events found',
          description: 'Join the club to get notifications about future events',
        ),
      );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${events.length} Club Events',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        AppSizes.smallY,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: AppPaddings.normalY,
          itemCount: events.length,
          separatorBuilder: (_, i) => AppSizes.smallY,
          itemBuilder: (_, i) {
            return EventTile(
              event: events[i],
              onPressed: () {
                context.pushTo(
                  EventDetailScreen(event: events[i]),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
