import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../controllers/get_user_provider.dart';
import '../entities/user_data.dart';

class UserTile extends ConsumerWidget {
  const UserTile({
    super.key,
    this.user,
    this.userId = '',
    this.trailing,
    this.onPressed,
    this.trailingWithUser,
  }) : assert(user != null || userId != '');

  final String userId;
  final UserData? user;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final Widget Function(UserData user)? trailingWithUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = this.user != null ? AsyncData(this.user!) : ref.watch(getUserProvider(userId));
    final user = userAsync.valueOrNull;

    var trailing = this.trailing;
    trailing ??= trailingWithUser == null || user == null ? null : trailingWithUser!(user);

    return ListTile(
      onTap: onPressed,
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
