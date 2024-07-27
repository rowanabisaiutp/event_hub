import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiComentarios {
  // Método para obtener comentarios filtrados por evento
  Future<List<Map<String, dynamic>>> fetchCommentsByEvento(int eventoId) async {
    final apiUrl =
        'https://api-digitalevent.onrender.com/api/comentario/list/$eventoId';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load comments');
    }
  }

  Future<void> postComment(
      int eventoId, int usuarioId, String comentario) async {
    final postApiUrl =
        "https://api-digitalevent.onrender.com/api/comentario/create/${eventoId}/${usuarioId}";

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
