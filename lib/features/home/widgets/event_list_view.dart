import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../entities/club.dart';
import '../entities/events_provider.dart';
import 'event_tile.dart';
import 'info_message.dart';

class EventListView extends ConsumerWidget {
  const EventListView({
    super.key,
    required this.club,
  });

  final Club club;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsProvider(club.id));

    if (eventsAsync.isLoading)
      return Text(
        'Loading Events',
        style: Theme.of(context).textTheme.titleLarge,
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
          '${events.length} Events',
          style: Theme.of(context).textTheme.titleLarge,
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
              onPressed: () {},
            );
          },
        ),
      ],
    );
  }
}
