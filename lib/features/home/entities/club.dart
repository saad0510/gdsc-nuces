class Club {
  final String id;
  final String title;
  final String description;
  final String coverImgUrl;
  final int membersCount;
  final String leadUserId;
  final List<String> coleadUserIds;
  final DateTime createdAt;

  const Club({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImgUrl,
    required this.membersCount,
    required this.leadUserId,
    required this.coleadUserIds,
    required this.createdAt,
  });
}
