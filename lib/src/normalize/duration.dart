import '../constant/millisecond.dart';

class IDuration {
  int days;
  int hours;
  int minutes;
  int seconds;

  IDuration({
    this.days = 0,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
  });
}

IDuration normalizeDuration(int value) {
  final result = IDuration(
    days: 0,
    hours: 0,
    minutes: 0,
    seconds: 0,
  );

  if (value <= 0) {
    return result;
  }

  final seconds = (value / MS_SECOND).ceil();
  final minutes = (value / MS_MINUTE).floor();
  final hours = (value / MS_HOUR).floor();
  final days = (value / MS_DAY).floor();

  if (days > 0) {
    result.days = days;
  }
  if (hours % 24 > 0) {
    result.hours = hours % 24;
  }
  if (minutes % 60 > 0) {
    result.minutes = minutes % 60;
  }
  if (seconds % 60 > 0) {
    result.seconds = seconds % 60;
  }

  return result;
}