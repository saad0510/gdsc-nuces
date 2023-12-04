import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/datetime_ext.dart';
import '../entities/event.dart';
import 'background_image_box.dart';
import 'icon_chip.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.event,
    this.onPressed,
  });

  final Event event;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: event.id,
      child: SizedBox(
        height: 150.h,
        child: BackgroundImageBox(
          imageUrl: event.coverImgUrl,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: AppPaddings.normal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        event.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                    IconChip(
                      icon: Icons.alarm,
                      text: '${event.duration.inHours} hrs',
                    ),
                    AppSizes.smallX,
                    IconChip(
                      icon: Icons.calendar_today,
                      text: event.startTime.timeFormated,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
