// ignore_for_file: file_names

class Schedule {
  final int id;
  final String name;
  final String timeFrom;
  final String timeTo;
  final String days;
  final int color;

  Schedule(
      {required this.id,
      required this.name,
      required this.timeFrom,
      required this.timeTo,
      required this.days,
      this.color = 0});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
        id: json['id'],
        name: json['name'],
        timeFrom: json['timeFrom'],
        timeTo: json['timeTo'],
        days: json['days'],
        color: int.parse(json['color']));
  }
}
