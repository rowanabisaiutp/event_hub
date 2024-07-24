// lib/services/api_service_count.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServiceCount {
  final String apiUrl = "http://10.2.2.0:5000/api/register";

  Future<void> register(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create account');
    }
  }
}
