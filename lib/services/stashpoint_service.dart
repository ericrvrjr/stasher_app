import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stasher_app/models/stashpoint/stashpoint.dart';

class StashpointService {
  Future<StashpointResponse> getStashpoints({int? page}) async {
    try {
      final String apiUrl =
          "${dotenv.env['API_BASE_URL']}/${dotenv.env['STASHPOINT_URL']}?page=$page";
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode != 200) {
        throw StashpointError(
            statusCode: response.statusCode,
            message: "Failed to load stashpoints");
      }
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return StashpointResponse.fromJson(jsonResponse);
    } on StashpointError catch (error) {
      debugPrint(
          'API ERROR: ${error.message} (${error.statusCode})');
      rethrow;
    } on Exception catch (e) {
      debugPrint('Something went wrong: $e');
      rethrow;
    }
  }
}

class StashpointResponse {
  final List<Stashpoint> stashpoints;
  final bool hasNext;
  final bool hasPrev;
  final int currentPage;
  final int totalPages;
  final int total;
  StashpointResponse(
      {required this.stashpoints,
      required this.hasNext,
      required this.currentPage,
      required this.hasPrev,
      required this.total,
      required this.totalPages});
  factory StashpointResponse.fromJson(Map<String, dynamic> json) =>
      StashpointResponse(
          stashpoints: (json['items'] as List)
              .map((dynamic item) => Stashpoint.fromJson(item))
              .toList(),
          hasNext: json['has_next'],
          currentPage: json['page'],
          hasPrev: json['has_prev'],
          total: json['total'],
          totalPages: json['pages']);
}

class StashpointError implements Exception {
  final int statusCode;
  final String message;

  StashpointError({required this.statusCode, required this.message});
  factory StashpointError.fromJson(Map<String, dynamic> json) =>
      StashpointError(
          statusCode: json['status_code'], message: json['message']);
}
