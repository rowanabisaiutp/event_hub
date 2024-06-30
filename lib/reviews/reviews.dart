import 'package:digital_event_hub/reviews/eventCali.dart';
import 'package:digital_event_hub/widgets/cards/cardReview.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  int _selectedIndex = 0; 

  static List<Widget> _widgetOptions = <Widget>[
    ReviewsScreen(),
    Center(child: Text('Tienda')),
    Center(child: Text('Perfil')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Reseñas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFCA8DD9),
        onTap: _onItemTapped,
      ),
    );
  }
}






////////////////////////////////////////////////////////////////////






List<Map<String, dynamic>> reviewsList = [
  {
    'id': 1,
    'username': 'Tere Leon',
    'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
    'qualification': 5.0,
    'title': 'TODO EXCELENTE',
    'text': 'Es una obra conmovedora que captura la esencia del amor trágico de Shakespeare, con actuaciones apasionadas y una escenografía impresionante.',
  },
  {
    'id': 2,
    'username': 'Juan Perez',
    'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
    'qualification': 4.5,
    'title': 'Muy Bueno',
    'text': 'La obra fue realmente buena, aunque algunos actores podrían mejorar su actuación. La escenografía fue excelente.',
  },
  {
    'id': 3,
    'username': 'Ana Gomez',
    'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
    'qualification': 4.0,
    'title': 'Buena pero con detalles',
    'text': 'Me gustó mucho la obra, pero hubo momentos en que se hizo un poco lenta. A pesar de eso, la recomiendo.',
  },
  {
    'id': 4,
    'username': 'Carlos Ruiz',
    'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
    'qualification': 3.5,
    'title': 'Regular',
    'text': 'La obra está bien, pero no me impresionó tanto como esperaba. La escenografía estuvo bien, pero la actuación no fue la mejor.',
  },
  {
    'id': 5,
    'username': 'Maria Lopez',
    'img': 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg', // Replace with actual image URL
    'qualification': 5.0,
    'title': 'Excelente!',
    'text': '¡Me encantó! La actuación, la escenografía, todo estuvo perfecto. Sin duda la mejor obra que he visto en mucho tiempo.',
  },
];


class ReviewsScreen extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 213, 170, 255),
        title: Text('Notificaciones'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40, right: 24, bottom: 0, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventCali(),
            SizedBox(height: 16.0),
            Divider(
              height: 40,
              color: Colors.grey,
              thickness: 1,
              indent : 0,
              endIndent : 0,       
            ),

            Expanded(
              child: ListView.builder(
                itemCount: reviewsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ReviewCard(
                        reviewsList[index]['username'] ?? '',
                        reviewsList[index]['img'] ?? '',
                        reviewsList[index]['qualification'].toString(),
                        reviewsList[index]['title'] ?? '',
                        reviewsList[index]['text'] ?? '',
                      ),
                      SizedBox(height: 10.0),
                    ],
                  );
                },
              ),
            )
            
          
          ],
        )
      ),
    );
  }
}
