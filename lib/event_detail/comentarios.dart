import 'dart:math';
import 'package:digital_event_hub/event_detail/api_cometarios.dart';
import 'package:digital_event_hub/sesion/login/idUser.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:digital_event_hub/widgets/cards/cardReview.dart';

void Comentarios(BuildContext context, TickerProvider vsync, int eventoId) {
  int userId = int.parse(UserSession().userId!);
  Future<List<Map<String, dynamic>>> commentsFuture = fetchCommentsAndUsers(eventoId);
  TextEditingController commentController = TextEditingController();
  ApiServiceComentarios apiService = ApiServiceComentarios();

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    transitionAnimationController: AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    ),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return FutureBuilder<List<Map<String, dynamic>>>(
            future: commentsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Skeletonizer(
                  enabled: true,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 5, // Número arbitrario para mostrar las tarjetas de carga
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(height: 5.0),
                          ReviewCard(
                            '', '', '', '', '',
                          ),
                          SizedBox(height: 10.0),
                        ],
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Map<String, dynamic>> reviewsList = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: reviewsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final comentario = reviewsList[index];
                            return Column(
                              children: [
                                SizedBox(height: 5.0),
                                Dismissible(
                                  key: Key(comentario['comentario_id'].toString()),
                                  direction: comentario['usuario_id'] == userId
                                      ? DismissDirection.endToStart
                                      : DismissDirection.none,
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onDismissed: comentario['usuario_id'] == userId
                                      ? (direction) async {
                                          try {
                                            await apiService.deleteComment(comentario['comentario_id']);
                                            reviewsList.removeAt(index);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Comentario eliminado')),
                                            );
                                          } catch (e) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Error al eliminar comentario: $e')),
                                            );
                                          }
                                        }
                                      : null,
                                  child: ReviewCard(
                                    comentario['username'] ?? '',
                                    comentario['img'] ?? '',
                                    comentario['qualification'].toString(),
                                    comentario['text'] ?? '',
                                    comentario['fecha'] ?? '',
                                  ),
                                ),
                                SizedBox(height: 10.0),
                              ],
                            );
                          },
                        ),
                      ),
                      /*PARA EL POST de comentarios*/
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: TextField(
                                    controller: commentController,
                                    decoration: InputDecoration(
                                      hintText: 'Escribe algo...',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                onPressed: () async {
                                  if (commentController.text.isNotEmpty) {
                                    try {
                                      await apiService.createComment(eventoId, userId, commentController.text);
                                      // Refresh comments
                                      commentsFuture = fetchCommentsAndUsers(eventoId);
                                      commentController.clear();
                                      Navigator.pop(context);
                                    } catch (e) {
                                      print('Failed to post comment: $e');
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      );
    },
  );
}

Future<List<Map<String, dynamic>>> fetchCommentsAndUsers(int eventoId) async {
  ApiServiceComentarios apiService = ApiServiceComentarios();
  List<Map<String, dynamic>> reviewsList = [];

  try {
    List<dynamic> comments = await apiService.fetchComments(eventoId);
    for (var comment in comments) {
      Map<String, dynamic> user = await apiService.fetchUser(comment['usuario_id']);
      reviewsList.add({
        'comentario_id': comment['comentario_id'],
        'usuario_id': comment['usuario_id'],
        'username': user['nombre'],
        'img': user['fotoPerfil'],
        'qualification': (Random().nextDouble() * 5).toStringAsFixed(1), // Calificación aleatoria
        'text': comment['comentario'],
        'fecha': comment['fecha'].substring(0, 10),
      });
    }
  } catch (e) {
    print('Error fetching comments and users: $e');
    throw e;
  }

  return reviewsList;
}
