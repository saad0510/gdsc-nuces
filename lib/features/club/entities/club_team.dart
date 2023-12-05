import 'club_levels.dart';
import 'club_user.dart';

class ClubTeam {
  final ClubUser lead;
  final List<ClubUser> coleads;

  const ClubTeam({
    required this.lead,
    required this.coleads,
  });

  const ClubTeam.empty()
      : lead = const ClubUser(
          userId: '',
          level: ClubLevels.lead,
        ),
        coleads = const [];

  List<ClubUser> get allUsers => [lead, ...coleads];

  ClubTeam copyWith({
    ClubUser? lead,
    List<ClubUser>? coleads,
  }) {
    return ClubTeam(
      lead: lead ?? this.lead,
      coleads: coleads ?? this.coleads,
    );
  }
}
