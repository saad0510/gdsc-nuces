import 'club_team.dart';

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
}
