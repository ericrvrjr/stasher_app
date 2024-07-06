import 'package:stasher_app/models/stashpoint/opening_hours.dart';
import 'package:stasher_app/models/stashpoint/opening_hours_exception.dart';

import 'nearest_city.dart';
import 'pricing_structure.dart';
import 'stashpoint_feature.dart';

class Stashpoint {
  final String? storageType;
  final String? deactivatedAt;
  final String? slug;
  final Feature? features;
  final double? userDistanceKm;
  final String? hostId;
  final String? upsellText;
  final List<OpeningHour>? openingHours;
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
  final List<OpeningHoursException>? openingHoursExceptions;
  final String? countryCode;
  final String? description;
  final String? postalCode;
  final String? timezone;
  final String? locationName;
  final int? capacity;
  final String? openingHoursText;
  final String? openStatus;

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
      this.openingHoursText,
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
      this.userDistanceKm,
      this.openStatus});

  factory Stashpoint.fromJson(Map<String, dynamic> json) {
    final openingHours = json['opening_hours'] != null
        ? (json['opening_hours'] as List)
            .map((dynamic item) => OpeningHour.fromJson(item))
            .toList()
        : null;
    final now = DateTime.now();
    int dayOfWeek = now.weekday;
    OpeningHour? openHours = openingHours?.firstWhere(
        (openingHour) => openingHour.day == dayOfWeek,
        orElse: () => OpeningHour());
    String? openHoursText;
    String? openStatus;

    if (openHours?.open != null) {
      if ((openingHours ?? [])
          .isNotEmpty /*now.hour >= openingTime.hour && now.hour < closingTime.hour*/) {
        openStatus = "Open";
        DateTime parsedOpenTime = DateTime.parse(
            "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${openHours!.open!}");
        int openingHours = parsedOpenTime.hour;
        int openingMinutes = parsedOpenTime.minute;
        String openingPeriod = 'AM';
        if (openingHours > 12) {
          openingPeriod = 'PM';
          openingHours -= 12;
        } else if (openingHours == 0) {
          openingHours = 12;
        }
        String formattedOpenHours = openingHours.toString().padLeft(2, '0');
        String opening;
        if (openingMinutes > 0) {
          opening =
              '$formattedOpenHours:${openingMinutes.toString().padLeft(2, '0')}$openingPeriod';
        } else {
          opening = '$formattedOpenHours$openingPeriod';
        }

        DateTime parsedCloseTime = DateTime.parse(
            "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${openHours.close!}");
        int closeHours = parsedCloseTime.hour;
        int closeMinutes = parsedCloseTime.minute;
        String closePeriod = 'AM';
        if (closeHours > 12) {
          closePeriod = 'PM';
          closeHours -= 12;
        } else if (closeHours == 0) {
          closeHours = 12;
        }
        String formattedCloseHours = closeHours.toString().padLeft(2, '0');
        String closing;
        if(closeMinutes >0){
        closing =
            '$formattedCloseHours:${closeMinutes.toString().padLeft(2, '0')}$closePeriod';
        }else{
          closing =
            '$formattedCloseHours$closePeriod';
        }
        openHoursText = "$opening-$closing";
      } else {
        openStatus = "Closed";
      }
    } else {
      openStatus = "Closed";
    }

    return Stashpoint(
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
        openingHours: openingHours,
        openingHoursExceptions: json['opening_hours_exceptions'] != null
            ? (json['opening_hours_exceptions'] as List)
                .map((dynamic item) => OpeningHoursException.fromJson(item))
                .toList()
            : null,
        photos: json['photos']?.cast<String>() ?? [],
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
        userDistanceKm: json['user_distance_km'],
        openStatus: openStatus,
        openingHoursText: openHoursText);
  }
}
