import '../../../core/extensions/text_ext.dart';

enum EventLevels {
  registered,
  attended;

  @override
  String toString() => name.capitalize();

  String toMap() => name;

  factory EventLevels.fromMap(dynamic data) {
    final name = data as String;
    return values.byName(name);
  }
}
