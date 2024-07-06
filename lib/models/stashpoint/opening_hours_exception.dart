class OpeningHoursException {
  final String? startTime;
  final String? name;
  final String? date;
  final String? type;
  final String? endTime;
  OpeningHoursException(
      {this.date, this.endTime, this.name, this.startTime, this.type});
  factory OpeningHoursException.fromJson(Map<String, dynamic> json) =>
      OpeningHoursException(
          date: json['date'],
          endTime: json['end_time'],
          name: json['name'],
          startTime: json['start_time'],
          type: json['type']);
}
