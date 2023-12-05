import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../auth/widgets/user_tile.dart';
import '../entities/event.dart';
import '../entities/event_levels.dart';
import '../entities/event_user.dart';
import '../repositories/event_repo.dart';
import '../repositories/permissions_repo.dart';
import 'value_picker_dialog.dart';

class EventMembersView extends ConsumerWidget {
  const EventMembersView({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final members = event.members;
    final attendees = members.where((m) => m.level == EventLevels.attended).toList();
    final registered = members.where((m) => m.level == EventLevels.registered).toList();

    final canChangeMembers = ref.watch(permissionsProvider).canChangeMembers(event);

    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.normal.copyWith(bottom: 0),
            child: const TabBar(
              tabs: [
                Tab(text: 'Attendees'),
                Tab(text: 'Registered'),
              ],
            ),
          ),
          SizedBox(
            height: 1.dh,
            child: TabBarView(
              children: [
                ListView.separated(
                  itemCount: attendees.length,
                  padding: AppPaddings.normalY,
                  separatorBuilder: (_, i) => AppSizes.smallY,
                  itemBuilder: (_, i) {
                    return UserTile(
                      userId: attendees[i].userId,
                      onPressed: !canChangeMembers
                          ? null
                          : () {
                              ValuePickerDialog(
                                values: EventLevels.values,
                                onPicked: (l) => changeStatus(ref, attendees[i], l),
                              ).show(context);
                            },
                    );
                  },
                ),
                ListView.separated(
                  itemCount: registered.length,
                  padding: AppPaddings.normalY,
                  separatorBuilder: (_, i) => AppSizes.smallY,
                  itemBuilder: (_, i) {
                    return UserTile(
                      userId: registered[i].userId,
                      onPressed: !canChangeMembers
                          ? null
                          : () {
                              ValuePickerDialog(
                                values: EventLevels.values,
                                onPicked: (l) => changeStatus(ref, registered[i], l),
                              ).show(context);
                            },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void changeStatus(WidgetRef ref, EventUser user, EventLevels level) {
    user = EventUser(userId: user.userId, level: level);
    final newEvent = event.copyWith(
      members: [
        for (final mem in event.members)
          if (mem.userId == user.userId) user else mem
      ],
    );
    ref.context.showLoadingUntil(
      ref.read(eventRepoProvider).updateEvent(newEvent),
      then: (_) => ref.context.pop(),
    );
  }
}
