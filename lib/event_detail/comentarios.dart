import 'package:digital_event_hub/event_detail/api_cometarios.dart';
import 'package:digital_event_hub/widgets/cards/cardReview.dart';
import 'package:flutter/material.dart';

void Comentarios(BuildContext context, TickerProvider vsync, int eventoId) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    transitionAnimationController: AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    ),
    builder: (BuildContext context) {
      return FutureBuilder<List<Map<String, dynamic>>>(
        future: ApiComentarios().fetchCommentsByEvento(eventoId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Sin comentarios'));
          }

          List<Map<String, dynamic>> reviewsList = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: reviewsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final userId =
                          reviewsList[index]['usuario_id'].toString();
                      return FutureBuilder<Map<String, String>>(
                        future: ApiComentarios().fetchUserDetails(userId),
                        builder: (context, userSnapshot) {
                          if (userSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (userSnapshot.hasError) {
                            return Center(
                                child: Text('Error: ${userSnapshot.error}'));
                          } else if (!userSnapshot.hasData) {
                            return Center(child: Text('Nombre no disponible'));
                          }

                          final userName = userSnapshot.data!['nombre']!;
                          final userProfilePic =
                              userSnapshot.data!['foto_perfil']!;

                          return Column(
                            children: [
                              SizedBox(height: 5.0),
                              ReviewCard(
                                userName,
                                userProfilePic,
                                reviewsList[index]['comentario_id'].toString(),
                                reviewsList[index]['fecha'] ?? '',
                                reviewsList[index]['comentario'] ?? '',
                              ),
                              SizedBox(height: 10.0),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
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
                        onPressed: () {
                          // Acción al presionar el botón
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}










// import 'package:digital_event_hub/widgets/cards/cardReview.dart';
// import 'package:flutter/material.dart';

// void Comentarios(BuildContext context, TickerProvider vsync) {
//   showModalBottomSheet<void>(
//     context: context,
//     backgroundColor: Colors.white,
//     transitionAnimationController: AnimationController(
//       vsync: vsync,
//       duration: const Duration(seconds: 1),
//       reverseDuration: const Duration(seconds: 1),
//     ),
//     builder: (BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: reviewsList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Column(
//                     children: [
//                       SizedBox(height: 5.0),
//                       ReviewCard(
//                         reviewsList[index]['username'] ?? '',
//                         reviewsList[index]['img'] ?? '',
//                         reviewsList[index]['qualification'].toString(),
//                         reviewsList[index]['title'] ?? '',
//                         reviewsList[index]['text'] ?? '',
//                       ),
//                       SizedBox(height: 10.0),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4,
//             offset: Offset(2, 2),
//           ),
//         ],
//         border: Border.all(
//           color: Colors.grey, // Color del borde
//           width: 1.0, // Ancho del borde
//         ),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Escribe algo...',
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send, color: Theme.of(context).colorScheme.tertiary,),
//             onPressed: () {
//               // Acción al presionar el botón
//             },
//           ),
//         ],
//       ),
//     )
//           ],
//         ),
//       );
//     },
//   );
// }

// List<Map<String, dynamic>> reviewsList = [
//   {
//     'id': 1,
//     'username': 'Tere Leon',
//     'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
//     'qualification': 5.0,
//     'title': 'TODO EXCELENTE',
//     'text': 'Es una obra conmovedora que captura la esencia del amor trágico de Shakespeare, con actuaciones apasionadas y una escenografía impresionante.',
//   },
//   {
//     'id': 2,
//     'username': 'Juan Perez',
//     'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
//     'qualification': 4.5,
//     'title': 'Muy Bueno',
//     'text': 'La obra fue realmente buena, aunque algunos actores podrían mejorar su actuación. La escenografía fue excelente.',
//   },
//   {
//     'id': 3,
//     'username': 'Ana Gomez',
//     'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
//     'qualification': 4.0,
//     'title': 'Buena pero con detalles',
//     'text': 'Me gustó mucho la obra, pero hubo momentos en que se hizo un poco lenta. A pesar de eso, la recomiendo.',
//   },
//   {
//     'id': 4,
//     'username': 'Carlos Ruiz',
//     'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
//     'qualification': 3.5,
//     'title': 'Regular',
//     'text': 'La obra está bien, pero no me impresionó tanto como esperaba. La escenografía estuvo bien, pero la actuación no fue la mejor.',
//   },
//   {
//     'id': 5,
//     'username': 'Maria Lopez',
//     'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
//     'qualification': 5.0,
//     'title': 'Excelente!',
//     'text': '¡Me encantó! La actuación, la escenografía, todo estuvo perfecto. Sin duda la mejor obra que he visto en mucho tiempo.',
//   },
// ];