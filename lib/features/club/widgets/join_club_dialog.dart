import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../app/theme/colors.dart';
import '../../../core/extensions/context_ext.dart';
import '../entities/club.dart';

class JoinClubForm extends ConsumerWidget {
  const JoinClubForm({
    super.key,
    required this.club,
  });

  final Club club;

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      insetPadding: AppPaddings.normal,
      titlePadding: AppPaddings.normal,
      contentPadding: AppPaddings.normal,
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      title: const Text(
        'Are you sure you want to\njoin this club?',
        textAlign: TextAlign.center,
      ),
      children: [
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
          child: const Text('Count me in!'),
        ),
        AppSizes.smallY,
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Maybe later'),
        ),
      ],
    );
  }
}
