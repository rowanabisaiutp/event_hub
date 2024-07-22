import 'package:digital_event_hub/event_detail/event_page.dart';
import 'package:digital_event_hub/history/purchase_history.dart';
import 'package:digital_event_hub/home/header.dart';
import 'package:digital_event_hub/map_event/map_event.dart';
import 'package:digital_event_hub/notification/notif.dart';
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
    PurchaseHistoryPage(),
    NotificationBar(),
    GoogleMapScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage('assets/bag.png'),
                height: 22,
                color: _selectedIndex == 1 ? Theme.of(context).colorScheme.tertiary : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage('assets/bell.png'),
                height: 22,
                color: _selectedIndex == 2 ? Theme.of(context).colorScheme.tertiary : Colors.grey),
            //FontAwesomeIcons.gamepad
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
                image: AssetImage('assets/Pin.png'),
                height: 22,
                color: _selectedIndex == 3 ? Theme.of(context).colorScheme.tertiary : Colors.grey),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.tertiary,
        unselectedItemColor: Colors.grey,
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
    'img': 'https://e.radio-grpp.io/normal/2016/08/17/553455_221714.png',
    'ubication': 'Ciudad de Ejemplo',
    'date': '2024-07-01',
    'id': '1',
  },
  {
    'title': 'Conferencia Virtual',
    'img':
        'https://www.latevaweb.com/diseno-web/webs-para-eventos.jpg',
    'ubication': 'Online',
    'date': '2024-07-15',
    'id': '2',
  },
  {
    'title': 'Evento de lanzamiento',
    'img': 'https://www.latevaweb.com/diseno-web/webs-para-eventos.jpg',
    'ubication': 'Ciudad de Ejemplo',
    'date': '2024-07-01',
    'id': '1',
  },
  {
    'title': 'Conferencia Virtual',
    'img':
        'https://e.radio-grpp.io/normal/2016/08/17/553455_221714.png',
    'ubication': 'Online',
    'date': '2024-07-15',
    'id': '2',
  },
];

class EventsListBody extends StatelessWidget {
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
          Expanded(
            // Ejemplo de altura fija
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: datos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventPage()),
                    );
                  },
                  child: Column(
                    children: [
                      CardEvent(
                          datos[index]['title'] ?? '',
                          datos[index]['img'] ?? '',
                          datos[index]['ubication'] ?? '',
                          datos[index]['date'] ?? '',
                          datos[index]['id'] ?? ''),
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
