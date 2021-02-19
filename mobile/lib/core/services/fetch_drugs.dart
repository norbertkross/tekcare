import 'package:http/http.dart' as http;
import 'package:tele_health/core/models/drug.dart';
import 'dart:convert';

/// reads the drugs from the database
/// and returns it.
/// a list of drugs are returned if avialable
/// else an error is returned.
class FetchDrugs {
  /// method to decode json data returned by responds
  /// to a dart object.
  static List<DrugModel> parsePharmacies(String response) {
    final parsed = json.decode(response).cast<Map<String, dynamic>>();
    return parsed
        .map<DrugModel>((json) => DrugModel.fromMap(json))
        .toList();
  }

  /// fetching data from the api
  static Future<List<DrugModel>> fetchDrugs() async {
    final response = await http.get('http://localhost:3000/pharmacy/all_drugs');
    if (response.statusCode == 200) {
      return parsePharmacies(response.body);
    } else {
      throw Exception("Failed to fetch pharmacies");
    }
  }
}
