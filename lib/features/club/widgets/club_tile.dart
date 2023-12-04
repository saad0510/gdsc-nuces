import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../entities/club.dart';
import 'background_image_box.dart';
import 'icon_chip.dart';

class ClubTile extends StatelessWidget {
  const ClubTile({
    super.key,
    required this.club,
    this.onPressed,
  });

  final Club club;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: club.id,
      child: SizedBox(
        height: 150.h,
        child: BackgroundImageBox(
          imageUrl: club.coverImgUrl,
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
                      club.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                    ),
                    AppSizes.tinyY,
                    AppSizes.tinyY,
                    IconChip(
                      icon: Icons.group,
                      text: club.membersCount.toString(),
                      color: Colors.white,
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
