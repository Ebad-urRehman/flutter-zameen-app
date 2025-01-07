import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  final url = Uri.parse(
      'https://zameen-flutter-backend-production.up.railway.app/api/get_unique');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    return Map<String, dynamic>.from(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Map> predictPrices(dataMap) async {
  final url = Uri.parse(
      'https://zameen-flutter-backend-production.up.railway.app/api/predict_prices');

  final response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(dataMap));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
    // print(response_data);
  } else {
    throw Exception('Failed to send data');
  }
}

Future<Map<String, dynamic>> fetchRecommendations() async {
  final url = Uri.parse(
      'https://zameen-flutter-backend-production.up.railway.app/api/fetch_recommendations');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    return Map<String, dynamic>.from(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Map<String, dynamic>> applyQuery(
    {required dataMap, required pageNo}) async {
  final url = Uri.parse(
      'https://zameen-flutter-backend-production.up.railway.app/api/query');

  Map updatedDataMap = {'data': dataMap, 'page_no': pageNo};
  final response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(updatedDataMap));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
    // print(response_data);
  } else {
    throw Exception('Failed to send data');
  }
}
