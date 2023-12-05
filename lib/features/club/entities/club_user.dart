import 'club_levels.dart';

class ClubUser {
  final String userId;
  final ClubLevels level;

  const ClubUser({
    required this.userId,
    required this.level,
  });

  factory ClubUser.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return ClubUser(
      userId: map['uid'],
      level: ClubLevels.fromMap(map['level']),
    );
  }
}
