class Event {
  final String id;
  final String clubId;
  final String title;
  final String description;
  final String venue;
  final DateTime startAt;
  final DateTime endAt;
  final String coverImgUrl;
  final DateTime createdAt;
  final List<String> summary;
  final List<String> registeredUids;
  final List<String> attendedUids;

  const Event({
    required this.id,
    required this.clubId,
    required this.title,
    required this.description,
    required this.venue,
    required this.startAt,
    required this.endAt,
    required this.coverImgUrl,
    required this.createdAt,
    required this.summary,
    required this.attendedUids,
    required this.registeredUids,
  });

  Duration get duration => endAt.difference(startAt);

  bool get hasClosed => startAt.isBefore(DateTime.now());
}
