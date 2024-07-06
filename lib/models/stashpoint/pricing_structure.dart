class PricingStructure {
  final int? guaranteeFee;
  final String? ccySymbol;
  final int? bookingFee;
  final String? ccy;
  final int? firstDayCost;
  final int? extraDayCost;
  final int? ccyMinorInMajor;

  PricingStructure(
      {this.guaranteeFee,
      this.ccySymbol,
      this.bookingFee,
      this.ccy,
      this.firstDayCost,
      this.extraDayCost,
      this.ccyMinorInMajor});

  factory PricingStructure.fromJson(Map<String, dynamic> json) =>
      PricingStructure(
          guaranteeFee: json['guarantee_fee'],
          ccySymbol: json['ccy_symbol'],
          bookingFee: json['booking_fee'],
          ccy: json['ccy'],
          firstDayCost: json['first_day_cost'],
          extraDayCost: json['extra_day_cost'],
          ccyMinorInMajor: json['ccy_minor_in_major']);
}
