import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../entities/club.dart';
import '../widgets/club_tile.dart';
import '../widgets/home_app_bar.dart';
import 'club_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (_, i) => AppSizes.normalY,
              itemBuilder: (_, i) {
                final club = Club(
                  id: i.toString(),
                  name: ['App Development', 'Web Development', 'Cyber Security'].elementAt(i % 3),
                  coverImgUrl: [
                    'https://www.gstatic.com/classroom/themes/img_code.jpg',
                    'https://www.gstatic.com/classroom/themes/img_bookclub_thumb.jpg',
                    'https://www.gstatic.com/classroom/themes/Honors_thumb.jpg'
                  ].elementAt(i % 3),
                );

                return ClubTile(
                  club: club,
                  onPressed: () {
                    context.pushTo(
                      ClubDetailScreen(club: club),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
