import 'package:tele_health/core/models/pharmacy.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// reads the pharmacies from the database
/// and returns it.
/// a list of pharmacies are returned if avialable
/// else an error is returned.

class FetchPharmacies {
  /// method to decode json data returned by responds
  /// to a dart object.
  static List<PharmacyModel> parsePharmacies(String response) {
    final parsed = json.decode(response).cast<Map<String, dynamic>>();
    return parsed
        .map<PharmacyModel>((json) => PharmacyModel.fromMap(json))
        .toList();
  }

  /// fetching data from the api
  static Future<List<PharmacyModel>> fetchPharmacies() async {
    final response = await http.get('http://localhost:3000/all_pharmacies');
    if (response.statusCode == 200) {
      return parsePharmacies(response.body);
    } else {
      throw Exception("Failed to fetch pharmacies");
    }
  }
}
