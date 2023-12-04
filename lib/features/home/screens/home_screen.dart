import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../entities/club.dart';
import '../widgets/club_tile.dart';
import '../widgets/home_app_bar.dart';

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
            const ClubTile(
              club: Club(
                id: '1231234ads',
                name: 'App Development',
                coverImgUrl: 'https://www.gstatic.com/classroom/themes/img_code.jpg',
              ),
            ),
            AppSizes.normalY,
            const ClubTile(
              club: Club(
                id: '1231234ads',
                name: 'Web Development',
                coverImgUrl: 'https://www.gstatic.com/classroom/themes/img_bookclub_thumb.jpg',
              ),
            ),
            AppSizes.normalY,
            const ClubTile(
              club: Club(
                id: '1231234ads',
                name: 'Cyber Security',
                coverImgUrl: 'https://www.gstatic.com/classroom/themes/Honors_thumb.jpg',
              ),
            ),
            AppSizes.normalY,
            const ClubTile(
              club: Club(
                id: '1231234ads',
                name: 'App Development',
                coverImgUrl: 'https://www.gstatic.com/classroom/themes/img_code.jpg',
              ),
            ),
            AppSizes.normalY,
            const ClubTile(
              club: Club(
                id: '1231234ads',
                name: 'Web Development',
                coverImgUrl: 'https://www.gstatic.com/classroom/themes/img_bookclub_thumb.jpg',
              ),
            ),
            AppSizes.normalY,
            const ClubTile(
              club: Club(
                id: '1231234ads',
                name: 'Cyber Security',
                coverImgUrl: 'https://www.gstatic.com/classroom/themes/Honors_thumb.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
