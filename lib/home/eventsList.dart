import 'package:digital_event_hub/home/header.dart';
import 'package:digital_event_hub/reviews/reviews.dart';
import 'package:digital_event_hub/widgets/cards/cardEvent.dart';
import 'package:digital_event_hub/widgets/scrollChips.dart';
import 'package:digital_event_hub/widgets/searchInput.dart';
import 'package:flutter/material.dart';

class EventsList extends StatefulWidget {
  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    EventsListBody(),
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
            label: 'Notificaciones',
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
        selectedItemColor: Color(0xFFD36AE4),
        onTap: _onItemTapped,
      ),
    );
  }
}





////////////////////////////////////////////////////////////////////






// class EventsListBody  extends StatefulWidget {

//   @override
//   State<EventsListBody> createState() => _EventsListBodyState();
// }

List<Map<String, String>> datos = [
  {
    'title': 'Evento de lanzamiento',
    'img': 'https://i.blogs.es/0ca9a6/aa/1366_2000.webp',
    'ubication': 'Ciudad de Ejemplo',
    'date': '2024-07-01',
    'id': '1',
  },
  {
    'title': 'Conferencia Virtual',
    'img': 'https://enriccompany.com/wp-content/uploads/2022/05/Contratar-conferenciantes.jpeg',
    'ubication': 'Online',
    'date': '2024-07-15',
    'id': '2',
  },
  {
    'title': 'Evento de lanzamiento',
    'img': 'https://i.blogs.es/0ca9a6/aa/1366_2000.webp',
    'ubication': 'Ciudad de Ejemplo',
    'date': '2024-07-01',
    'id': '1',
  },
  {
    'title': 'Conferencia Virtual',
    'img': 'https://enriccompany.com/wp-content/uploads/2022/05/Contratar-conferenciantes.jpeg',
    'ubication': 'Online',
    'date': '2024-07-15',
    'id': '2',
  },
];

class EventsListBody extends StatelessWidget  {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, right: 24, bottom: 0, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderHome(),
          SizedBox(height: 24.0),
          InputSearch(),
          SizedBox(height: 10.0),
          ScrollChips(),
          SizedBox(height: 10.0),

          Expanded(// Ejemplo de altura fija
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: datos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reviews()),
                    );
                  },
                  child: Column(
                    
                    children: [
                      CardEvent(
                        datos[index]['title'] ?? '',
                        datos[index]['img'] ?? '',
                        datos[index]['ubication'] ?? '',
                        datos[index]['date'] ?? '',
                        datos[index]['id'] ?? ''
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                );
              },
            ),
          )
         
        ],
      ),
    );
  }
}