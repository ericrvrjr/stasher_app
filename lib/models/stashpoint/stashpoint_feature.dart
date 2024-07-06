class Feature {
  final bool oftenFullyBooked;
  final bool premiumStashpoint;

  Feature({this.oftenFullyBooked = false, this.premiumStashpoint = false});

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
      oftenFullyBooked: json['often_fully_booked'],
      premiumStashpoint: json['premium_stashpoint']);
}
