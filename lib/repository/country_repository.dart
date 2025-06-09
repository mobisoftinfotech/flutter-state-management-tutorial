import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/country_model.dart';

class CountryRepository {
  final String baseUrl = 'https://restcountries.com/v3.1';

  Future<List<CountryModel>> searchCountry(String name) async {
    if (name.trim().isEmpty) {
      throw Exception('Please enter a country name.');
    }
    try {
      final response = await http.get(Uri.parse('$baseUrl/name/$name'));
      
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((e) => CountryModel.fromJson(e)).toList();
      } else {
        throw Exception('No country found for "$name".');
      }
    } catch (e) {
      rethrow;
    }
  }
} 