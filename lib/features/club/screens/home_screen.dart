import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/clubs_provider.dart';
import '../widgets/clubs_list_view.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: ClubsListView(
        clubs: ref.watch(clubsProvider),
      ),
    );
  }
}
