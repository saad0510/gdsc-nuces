import 'club_team.dart';
import 'club_user.dart';

class Club {
  final String id;
  final String title;
  final String description;
  final String coverImgUrl;
  final int membersCount;
  final ClubTeam team;
  final DateTime createdAt;

  const Club({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImgUrl,
    required this.membersCount,
    required this.team,
    required this.createdAt,
  });

  factory Club.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return Club(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      coverImgUrl: map['image'],
      membersCount: map['members'],
      team: ClubTeam.fromUsers(
        List.from(
          map['team'].map(ClubUser.fromMap),
        ),
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Club copyWith({
    String? id,
    String? title,
    String? description,
    String? coverImgUrl,
    int? membersCount,
    ClubTeam? team,
    DateTime? createdAt,
  }) {
    return Club(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      coverImgUrl: coverImgUrl ?? this.coverImgUrl,
      membersCount: membersCount ?? this.membersCount,
      team: team ?? this.team,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
