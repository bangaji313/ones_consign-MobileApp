import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseurl = 'https://api.github.com'; // Replace with base url

  // Get request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseurl/$endpoint'));
    return _handResponse(response);
  }

  // Post request
  static Future<Map<String, dynamic>> post (String endpoint, dynamic data) async {
    final response = await http.post(
        Uri.parse('$_baseurl/$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data)
    );
    return _handResponse(response);
  }

  // PUT request
  static Future<Map<String, dynamic>> put (String endpoint, dynamic data) async {
    final response = await http.put(
        Uri.parse('$_baseurl/$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data)
    );
    return _handResponse(response);
  }

  // HTTP response
  static Map<String, dynamic> _handResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}