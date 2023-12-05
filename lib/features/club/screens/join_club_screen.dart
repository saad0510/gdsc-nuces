import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../auth/widgets/app_text_field.dart';
import '../entities/club.dart';

class JoinClubScreen extends ConsumerStatefulWidget {
  const JoinClubScreen({
    super.key,
    required this.club,
  });

  final Club club;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JoinClubScreenState();
}

class _JoinClubScreenState extends ConsumerState<JoinClubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Club'),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField.readonly(
              label: 'Club Name',
              initialValue: widget.club.title,
            ),
            AppSizes.normalY,
            AppTextField.readonly(
              label: 'Club Name',
              initialValue: widget.club.title,
            ),
          ],
        ),
      ),
    );
  }
}
