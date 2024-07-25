import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServiceLogin {
  final String apiUrl = "https://api-digitalevent.onrender.com/api/auth/login";

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create account');
    }

    return json.decode(response.body);
  }
}
