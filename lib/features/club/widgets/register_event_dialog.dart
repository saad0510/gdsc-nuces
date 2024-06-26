import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../app/theme/colors.dart';
import '../../../core/extensions/context_ext.dart';
import '../../auth/controllers/auth_notifier.dart';
import '../entities/event.dart';
import '../entities/event_levels.dart';
import '../entities/event_user.dart';
import '../repositories/event_repo.dart';

class RegisterEventDialog extends ConsumerWidget {
  const RegisterEventDialog({
    super.key,
    required this.event,
  });

  final Event event;

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      insetPadding: AppPaddings.normal,
      titlePadding: AppPaddings.normal,
      contentPadding: AppPaddings.normal,
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      title: const Text(
        'Are you sure you want to\nregister for this event?',
        textAlign: TextAlign.center,
      ),
      children: [
        ElevatedButton(
          onPressed: () {
            final user = ref.read(userProvider)!;
            final newEvent = event.copyWith(
              members: [
                ...event.members,
                EventUser(
                  userId: user.uid,
                  level: EventLevels.registered,
                ),
              ],
            );
            context.showLoadingUntil(
              ref.read(eventRepoProvider).updateEvent(newEvent),
              then: (_) {
                context.pop();
                context.pop();
              },
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
          child: const Text('Let\' go!'),
        ),
        AppSizes.smallY,
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Maybe later'),
        ),
      ],
    );
  }
}
