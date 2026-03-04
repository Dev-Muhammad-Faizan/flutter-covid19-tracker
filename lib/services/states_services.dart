import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/countires_api.dart';
import '../Models/worldstates.dart';
class StatesServices {
  static const String baseUrl = "https://disease.sh/v3/covid-19/all";

  Future<CovidStats> fetchWorldStats() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return CovidStats.fromJson(data);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<List<CountryData>> fetchCountriesData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return countryDataFromJson(response.body);
    } else {
      throw Exception("Failed to load countries data: ${response.statusCode}");
    }
  }


}