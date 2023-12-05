import '../../../app/constants.dart';
import 'event_user.dart';

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
  final bool approved;
  final List<String> summary;
  final List<EventUser> members;

  // TODO: add created by

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
    required this.approved,
    required this.summary,
    required this.members,
  });

  Event.empty()
      : id = '',
        clubId = '',
        title = '',
        description = '',
        venue = '',
        startAt = DateTime(0),
        endAt = DateTime(0),
        coverImgUrl = AppConstants.coverImages.first,
        createdAt = DateTime(0),
        approved = true,
        summary = const [],
        members = const [];

  Duration get duration => endAt.difference(startAt);

  bool get hasClosed => startAt.isBefore(DateTime.now());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'clubId': clubId,
      'title': title,
      'description': description,
      'venue': venue,
      'startAt': startAt.millisecondsSinceEpoch,
      'endAt': endAt.millisecondsSinceEpoch,
      'image': coverImgUrl,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'approval': approved,
      'summary': summary,
      'members': members.map((m) => m.toMap()).toList(),
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      clubId: map['clubId'],
      title: map['title'],
      description: map['description'],
      venue: map['venue'],
      startAt: DateTime.fromMillisecondsSinceEpoch(map['startAt']),
      endAt: DateTime.fromMillisecondsSinceEpoch(map['endAt']),
      coverImgUrl: map['image'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      approved: map['approval'],
      summary: List<String>.from(map['summary']),
      members: List.from(
        map['members'].map(EventUser.fromMap),
      ),
    );
  }

  Event copyWith({
    String? id,
    String? clubId,
    String? title,
    String? description,
    String? venue,
    DateTime? startAt,
    DateTime? endAt,
    String? coverImgUrl,
    DateTime? createdAt,
    bool? needsApproval,
    List<String>? summary,
    List<EventUser>? members,
  }) {
    return Event(
      id: id ?? this.id,
      clubId: clubId ?? this.clubId,
      title: title ?? this.title,
      description: description ?? this.description,
      venue: venue ?? this.venue,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      coverImgUrl: coverImgUrl ?? this.coverImgUrl,
      createdAt: createdAt ?? this.createdAt,
      approved: needsApproval ?? approved,
      summary: summary ?? this.summary,
      members: members ?? this.members,
    );
  }
}
