import 'package:flutter/material.dart';
import 'package:stasher_app/models/stashpoint/stashpoint.dart';

class StashpointView extends StatelessWidget {
  final Stashpoint stashpoint;

  const StashpointView({super.key, required this.stashpoint});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 339,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFD0D5DD))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFEFF8FF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFD1E9FF))),
                      height: 60,
                      width: 60,
                      child: const Icon(Icons.smoke_free,
                          size: 40.0, color: Colors.blue)),
                  const SizedBox(width: 12.0),
                  SizedBox(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 28,
                          width: 121,
                          child: Text(
                            stashpoint.name!, // Shop name
                            style: const TextStyle(
                                fontSize: 22.0,
                                color: Color(0xFF1D2939),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        SizedBox(
                          height: 28,
                          width: 121,
                          child: Text(
                            stashpoint.locationName!, // Location
                            style: const TextStyle(
                                color: Color(0xFF667086), fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 17,
                      ),
                      const SizedBox(width: 4.0),
                      SizedBox(
                          width: 53,
                          height: 24,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${stashpoint.rating} (${stashpoint.ratingCount}+)',
                              style: const TextStyle(color: Color(0xFF1D2939)),
                            ),
                          ))
                    ],
                  ),
                  if ((stashpoint.openLate ?? false) &&
                      stashpoint.openStatus == "Open")
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.purple)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.nightlight_outlined,
                            size: 18,
                            color: Colors.purple,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Open Till Late",
                            style: TextStyle(color: Colors.purple),
                          ),
                        ],
                      ),
                    )
                ],
              ),
              const SizedBox(height: 4.0), // Adjust spacing as needed
              Row(
                children: [
                  Text(
                    stashpoint.openStatus!,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: stashpoint.openStatus == "Open"
                            ? const Color(0xFF087443)
                            : Colors.red),
                  ),
                  const SizedBox(width: 4.0),
                  if (stashpoint.openingHoursText != null)
                    Text(
                      '(${stashpoint.openingHoursText})',
                      style: const TextStyle(
                          fontSize: 16.0, color: Color(0xFF667085)),
                    ),
                ],
              ),
              const SizedBox(height: 4.0), // Adjust spacing as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${stashpoint.userDistanceKm} km from your location', // Distance
                        style: const TextStyle(
                            fontSize: 14.0, color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8.0), // Adjust spacing as needed
                  Row(
                    children: [
                      Text(
                        '${stashpoint.pricingStructure?.ccySymbol}${stashpoint.pricingStructure?.firstDayCost}',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4.0),
                      const Text(
                        'bag/day',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
