import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/datetime_ext.dart';
import '../entities/event.dart';
import '../widgets/background_image_box.dart';
import '../widgets/info_chip.dart';
import 'bullet_text.dart';

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
            BackgroundImageBox(
              imageUrl: event.coverImgUrl,
              child: SizedBox(height: 200.h),
            ),
            AppSizes.normalY,
            Text(
              event.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            AppSizes.mediumY,
            Wrap(
              spacing: 15.sp,
              runSpacing: 5.sp,
              children: [
                InfoChip(
                  icon: Icons.calendar_month,
                  title: event.startAt.dateFormatedLong,
                ),
                InfoChip(
                  icon: Icons.alarm,
                  title: event.startAt.timeFormated,
                ),
                InfoChip(
                  icon: Icons.lock_clock_outlined,
                  title: '${event.duration.inHours} Hrs',
                ),
                InfoChip(
                  icon: Icons.location_on,
                  title: event.venue,
                ),
              ],
            ),
            AppSizes.mediumY,
            Text(event.description),
            for (final point in event.summary) ...[
              AppSizes.tinyY,
              BulletText(point),
            ],
          ],
        ),
      ),
    );
  }
}
