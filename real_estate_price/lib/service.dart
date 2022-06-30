import 'dart:convert';

import 'package:http/http.dart' as http;

List locations = [];
void main(List<String> args) {
  getEstimatedPrice();
}

Future<void> getLocations() async {
  var url = Uri.parse(
      'https://real-state-price-prediction.herokuapp.com/get_location_names');
  var response = await http.get(url);

  Map data = jsonDecode(response.body);
  locations = data['locations'];
  print(locations);
}

int bhk = 2, bath = 2;
var area = 1000;
var estimatedprice;
var _selectedLocation = '1st Phase JP Nagar';
Future<void> getEstimatedPrice() async {
  var url = Uri.parse(
      'https://real-state-price-prediction.herokuapp.com/predict_home_price');
  // Response response = await get(url);
  // Map data = jsonDecode(response.body);
  var response = await http.post(url, body: {
    'total_sqft': '$area',
    'location': _selectedLocation,
    'bhk': '$bhk',
    'bath': '$bath'
  });
  Map data = jsonDecode(response.body);
  estimatedprice = data['estimated_price'].toStringAsFixed(2);
  
  print('Response status: ${response.statusCode}');
  print(estimatedprice);
}
