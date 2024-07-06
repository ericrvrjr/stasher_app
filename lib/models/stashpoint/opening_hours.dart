class OpeningHour {
  final int? day;
  final String? open;
  final String? close;

  OpeningHour({this.day, this.open, this.close});

  factory OpeningHour.fromJson(Map<String, dynamic> json) =>
      OpeningHour(day: json['day'], close: json['close'], open: json['open']);
}
