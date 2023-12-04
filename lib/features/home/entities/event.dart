class Event {
  final String id;
  final String clubId;
  final String title;
  final String description;
  final String venue;
  final DateTime startTime;
  final DateTime endTime;
  final String coverImgUrl;
  final DateTime createdAt;

  const Event({
    required this.id,
    required this.clubId,
    required this.title,
    required this.description,
    required this.venue,
    required this.startTime,
    required this.endTime,
    required this.coverImgUrl,
    required this.createdAt,
  });

  Duration get duration => endTime.difference(startTime);
}
