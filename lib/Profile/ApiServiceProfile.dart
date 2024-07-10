import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServiceProfile {
  final String apiUrl = "aqui va tu url del usuario";

  Future<Map<String, dynamic>> fetchUserData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> updateUserData(Map<String, dynamic> updatedData) async {
    final response = await http.patch(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update data');
    }
  }
}