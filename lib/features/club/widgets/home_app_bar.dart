import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      AppSizes.tinyY,
                      Text(
                        'Saad Bin Khalid',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
            AppSizes.normalY,
            TextField(
              decoration: InputDecoration(
                hintText: 'Search clubs by name',
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                suffixIcon: IconButton(
                  onPressed: () {},
                  iconSize: 30.sp,
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 215.h);
}
