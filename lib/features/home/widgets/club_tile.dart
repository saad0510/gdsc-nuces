import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../entities/club.dart';
import 'background_image_box.dart';

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
        height: 200.h,
        child: BackgroundImageBox(
          imageUrl: club.coverImgUrl,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                padding: AppPaddings.normal,
                alignment: Alignment.bottomLeft,
                child: Text(
                  club.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
