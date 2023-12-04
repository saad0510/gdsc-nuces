import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/user_data.dart';

const _names = ['Saad Bin Khalid', 'Abdul Rahman', 'Rahim Syed', 'Abdullah Jawed'];

final getUserProvider = FutureProvider.autoDispose.family<UserData, String>(
  (ref, userId) async {
    await Future.delayed(const Duration(seconds: 2));
    final i = Random().nextInt(10);
    return UserData(
      name: _names[i % 4],
      email: 'abc@gmail.com',
      imageUrl: 'https://i.pravatar.cc/300?img=$i',
    );
  },
);
