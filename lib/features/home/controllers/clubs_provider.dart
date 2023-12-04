import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/club.dart';

const _names = ['App Development', 'Web Development', 'Cyber Security'];
const _description =
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus, sequi suscipit quisquam quos, quidem laboriosam alias earum, quas atque eius architecto. Rem aut distinctio repellat, vero molestias dolore sit laborum.';
const _coverImages = [
  'https://www.gstatic.com/classroom/themes/img_code.jpg',
  'https://www.gstatic.com/classroom/themes/img_bookclub_thumb.jpg',
  'https://www.gstatic.com/classroom/themes/Honors_thumb.jpg'
];

final clubsProvider = Provider<List<Club>>(
  (ref) {
    return List.generate(
      10,
      (i) => Club(
        id: i.toString(),
        title: _names[i % 3],
        description: _description,
        coverImgUrl: _coverImages[i % 3],
        membersCount: Random().nextInt(50) + 10,
        leadUserId: 'leadUserId-$i',
        coleadUserIds: List.generate(
          Random().nextInt(3),
          (j) => '$i-coleadUserId-$j',
        ),
        createdAt: DateTime.now(),
      ),
    );
  },
);
