import 'event_levels.dart';

class EventUser {
  final String userId;
  final EventLevels level;

  const EventUser({
    required this.userId,
    required this.level,
  });

  factory EventUser.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return EventUser(
      userId: map['uid'],
      level: EventLevels.fromMap(map['level']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': userId,
      'level': level.toMap(),
    };
  }
}
