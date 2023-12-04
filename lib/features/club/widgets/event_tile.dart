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
        height: 130.h,
        child: BackgroundImageBox(
          imageUrl: event.coverImgUrl,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: AppPaddings.normal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      event.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                    AppSizes.tinyY,
                    AppSizes.tinyY,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconChip(
                          icon: Icons.alarm,
                          text: event.startAt.timeFormated,
                          color: Colors.white,
                        ),
                        AppSizes.smallX,
                        IconChip(
                          icon: Icons.calendar_today,
                          text: event.startAt.dateFormatedLong,
                          color: Colors.white,
                        ),
                      ],
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
