import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiComentarios {
  final String baseUrl = "https://api-digitalevent.onrender.com/api/comentario";
  final String usersUrl = "https://api-digitalevent.onrender.com/api/users";

  Future<List<Map<String, dynamic>>> fetchCommentsByEvento(int eventoId) async {
    final response = await http.get(Uri.parse('$baseUrl/list/$eventoId'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load comments');
    }
  }

  Future<Map<String, String>> fetchUserDetails(String userId) async {
    try {
      final response = await http.get(Uri.parse('$usersUrl/$userId'));
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        final fotoPerfilUrl = userData['fotoPerfil'].startsWith('http')
            ? userData['fotoPerfil']
            : 'https://api-digitalevent.onrender.com${userData['fotoPerfil']}';
        return {
          'nombre': userData['nombre'] ?? 'Nombre no disponible',
          'foto_perfil': fotoPerfilUrl,
        };
      } else {
        return {
          'nombre': 'Nombre no disponible',
          'foto_perfil':
              'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg',
        };
      }
    } catch (e) {
      return {
        'nombre': 'Nombre no disponible',
        'foto_perfil':
            'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg',
      };
    }
  }
}
