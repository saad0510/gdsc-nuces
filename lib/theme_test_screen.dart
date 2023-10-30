import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc/app/theme/colors.dart';
import 'package:gdsc/core/extensions/context_ext.dart';

import 'app/sizer.dart';
import 'app/theme/theme.dart';

class ThemeTestScreen extends ConsumerWidget {
  const ThemeTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Title'),
        actions: [
          IconButton(
            onPressed: () => toggleTheme(ref),
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: 'ayyansaad46@gmail.com',
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (x) => x!.isEmpty ? 'This field is required' : null,
            ),
            AppSizes.largeY,
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            AppSizes.largeY,
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: AppPaddings.small,
                      child: const Text('Card#1'),
                    ),
                  ),
                ),
                AppSizes.smallX,
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: AppPaddings.small,
                      child: const Text('Card#2'),
                    ),
                  ),
                ),
              ],
            ),
            AppSizes.largeY,
            const Divider(),
            AppSizes.largeY,
            ElevatedButton(
              onPressed: () {},
              child: const Text('Press'),
            ),
            AppSizes.smallY,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue),
              child: const Text('Press'),
            ),
            AppSizes.smallY,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.green),
              child: const Text('Press'),
            ),
            AppSizes.smallY,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.yellow),
              child: const Text('Press'),
            ),
            AppSizes.normalY,
            TextButton(
              onPressed: () {
                context.showError('This is some error message');
              },
              child: const Text('Show Error'),
            ),
          ],
        ),
      ),
    );
  }

  void toggleTheme(WidgetRef ref) {
    ref.read(themeModeProvider.notifier).update(
          (state) => state == Brightness.dark ? Brightness.light : Brightness.dark,
        );
  }
}
