import '../../../core/extensions/text_ext.dart';

enum ClubLevels {
  member,
  colead,
  lead;

  @override
  String toString() => name.capitalize();
}
