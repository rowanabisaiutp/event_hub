import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiComentarios {
  String get apiUrl =>
      "https://api-digitalevent.onrender.com/api/comentario/list";

  Future<List<Map<String, dynamic>>> fetchComentData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> postComment(
      int eventoId, int usuarioId, String comentario) async {
    final postApiUrl =
        "https://api-digitalevent.onrender.com//api/comentario/create/${eventoId}/${usuarioId}";

    final response = await http.post(
      Uri.parse(postApiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'comentario': comentario}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to post comment');
    }
  }
}
