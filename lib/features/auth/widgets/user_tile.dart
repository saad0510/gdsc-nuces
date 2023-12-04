import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../controllers/get_user_provider.dart';
import '../entities/user_data.dart';

class UserTile extends ConsumerWidget {
  const UserTile({
    super.key,
    required this.userId,
    this.trailing,
    this.trailingWithUser,
  });

  final String userId;
  final Widget? trailing;
  final Widget Function(UserData user)? trailingWithUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(getUserProvider(userId));
    final user = userAsync.valueOrNull;

    var trailing = this.trailing;
    trailing ??= trailingWithUser == null || user == null ? null : trailingWithUser!(user);

    return ListTile(
      onTap: () {},
      contentPadding: AppPaddings.smallX,
      leading: CircleAvatar(
        radius: 33.sp,
        foregroundImage: user == null ? null : NetworkImage(user.imageUrl),
      ),
      title: Text(
        user?.name ?? 'Loading',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(user?.email ?? '. . . . '),
      trailing: trailing,
    );
  }
}
