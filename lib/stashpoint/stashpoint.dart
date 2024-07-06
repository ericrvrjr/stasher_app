import 'package:stasher_app/models/stashpoint/nearest_city.dart';
import 'package:stasher_app/models/stashpoint/pricing_structure.dart';
import 'package:stasher_app/models/stashpoint/stashpoint_feature.dart';

class Stashpoint {
  final String? storageType;
  final String? deactivatedAt;
  final String? slug;
  final Feature? features;
  final int? userDistanceKm;
  final String? hostId;
  final String? upsellText;
  final List<String>? openingHours;
  final PricingStructure? pricingStructure;
  final String? sizeStandard;
  final String? upsellPhoto;
  final bool? openLate;
  final String? holidayOpenType;
  final String? upsellLink;
  final String? name;
  final String? sizeRestrictions;
  final int? treePrice;
  final NearestCity? nearestCity;
  final bool? openTwentyfourSeven;
  final int? bookingCountGroup;
  final String? type;
  final double? latitude;
  final String? activatedAt;
  final int? ratingCount;
  final String? created;
  final List<String>? photos;
  final bool? featured;
  final double? rating;
  final int? bookingFee;
  final double? longitude;
  final String? id;
  final List<String>? openingHoursExceptions;
  final String? countryCode;
  final String? description;
  final String? postalCode;
  final String? timezone;
  final String? locationName;
  final int? capacity;

  Stashpoint(
      {this.activatedAt,
      this.bookingCountGroup,
      this.bookingFee,
      this.capacity,
      this.countryCode,
      this.created,
      this.deactivatedAt,
      this.description,
      this.featured,
      this.features,
      this.holidayOpenType,
      this.hostId,
      this.id,
      this.latitude,
      this.locationName,
      this.longitude,
      this.name,
      this.nearestCity,
      this.openLate,
      this.openTwentyfourSeven,
      this.openingHours,
      this.openingHoursExceptions,
      this.photos,
      this.postalCode,
      this.pricingStructure,
      this.rating,
      this.ratingCount,
      this.sizeRestrictions,
      this.sizeStandard,
      this.slug,
      this.storageType,
      this.timezone,
      this.treePrice,
      this.type,
      this.upsellLink,
      this.upsellPhoto,
      this.upsellText,
      this.userDistanceKm});

  factory Stashpoint.fromJson(Map<String, dynamic> json) => Stashpoint(
      activatedAt: json['activated_at'],
      bookingCountGroup: json['booking_count_group'],
      bookingFee: json['booking_fee'],
      capacity: json['capacity'],
      countryCode: json['country_code'],
      created: json['created'],
      deactivatedAt: json['deactivated_at'],
      description: json['description'],
      featured: json['featured'],
      features: Feature.fromJson(json['features']),
      holidayOpenType: json['holiday_open_type'],
      hostId: json['host_id'],
      id: json['id'],
      latitude: json['latitude'],
      locationName: json['location_name'],
      longitude: json['longitude'],
      name: json['name'],
      nearestCity: NearestCity.fromJson(json['nearest_city']),
      openLate: json['open_late'],
      openTwentyfourSeven: json['open_twentyfour_seven'],
      openingHours: json['opening_hours'],
      openingHoursExceptions: json['opening_hours_exceptions'],
      photos: json['photos'],
      postalCode: json['postal_code'],
      pricingStructure: PricingStructure.fromJson(json['pricing_structure']),
      rating: json['rating'],
      ratingCount: json['rating_count'],
      sizeRestrictions: json['size_restrictions'],
      sizeStandard: json['size_standard'],
      slug: json['slug'],
      storageType: json['storage_type'],
      timezone: json['timezone'],
      treePrice: json['tree_price'],
      type: json['type'],
      upsellLink: json['upsell_link'],
      upsellPhoto: json['upsell_photo'],
      upsellText: json['upsell_text'],
      userDistanceKm: json['user_distance_km']);
}
