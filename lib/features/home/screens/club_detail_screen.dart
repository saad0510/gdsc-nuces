import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../entities/club.dart';
import '../widgets/club_tile.dart';

class ClubDetailScreen extends StatelessWidget {
  const ClubDetailScreen({super.key, required this.club});

  final Club club;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSizes.normalY,
            ClubTile(club: club),
          ],
        ),
      ),
    );
  }
}
