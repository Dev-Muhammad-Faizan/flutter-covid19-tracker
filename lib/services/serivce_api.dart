
import 'package:http/http.dart' as http;

import '../Models/countires_api.dart';

class SerivceApi {


  Future<List<CountryData>> getCounties() async {
    final response = await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    if (response.statusCode == 200) {
      return countryDataFromJson(response.body);
    } else {
      throw Exception("Failed to load countries");
    }
  }
}
