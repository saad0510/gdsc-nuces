extension DateStrExt on DateTime {
  String get dateFormatedLong => '$day ${_monthName[month]} ${year % 100}';

  String get dateFormated => '$day ${_monthName[month]}';

  String get timeFormated {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String get weekdayName => _weekdayName[weekday]!;

  String get montgName => _monthName[month]!;

  bool isBetween(DateTime past, DateTime future) {
    if (this == past || this == future) return true;
    return isAfter(past) && isBefore(future);
  }
}

final _monthName = {
  DateTime.january: 'Jan',
  DateTime.february: 'Feb',
  DateTime.march: 'Mar',
  DateTime.april: 'Apr',
  DateTime.may: 'May',
  DateTime.june: 'Jun',
  DateTime.july: 'Jul',
  DateTime.august: 'Aug',
  DateTime.september: 'Sep',
  DateTime.october: 'Oct',
  DateTime.november: 'Nov',
  DateTime.december: 'Dec',
};

final _weekdayName = {
  DateTime.monday: 'Monday',
  DateTime.tuesday: 'Tuesday',
  DateTime.wednesday: 'Wednesday',
  DateTime.thursday: 'Thursday',
  DateTime.friday: 'Friday',
  DateTime.saturday: 'Saturday',
  DateTime.sunday: 'Sunday',
};
