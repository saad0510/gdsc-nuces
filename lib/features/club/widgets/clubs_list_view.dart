import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../entities/club.dart';
import '../screens/club_detail_screen.dart';
import 'club_tile.dart';
import 'info_message.dart';

class ClubsListView extends StatelessWidget {
  const ClubsListView({
    super.key,
    required this.clubs,
  });

  final AsyncValue<List<Club>> clubs;

  @override
  Widget build(BuildContext context) {
    final clubsAsync = this.clubs;

    if (clubsAsync.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (clubsAsync.hasError) {
      return Center(
        child: InfoMessage.error(
          title: 'An error occured',
          description: clubsAsync.error!.toString(),
        ),
      );
    }

    final clubs = clubsAsync.valueOrNull ?? const [];
    if (clubs.isEmpty)
      return const Center(
        child: InfoMessage.empty(
          title: 'No clubs found',
          description: 'Click the add button on home screen to create and see clubs here',
        ),
      );

    return ListView.separated(
      padding: AppPaddings.normal,
      itemCount: clubs.length,
      separatorBuilder: (_, i) => AppSizes.smallY,
      itemBuilder: (_, i) {
        return ClubTile(
          club: clubs[i],
          onPressed: () {
            context.pushTo(
              ClubDetailScreen(club: clubs[i]),
            );
          },
        );
      },
    );
  }
}
