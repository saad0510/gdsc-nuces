import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../entities/club.dart';

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
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(club.coverImgUrl),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onPressed,
                child: Container(
                  padding: AppPaddings.normal,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    club.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
