import 'package:flutter/material.dart';

class NotificationBar extends StatefulWidget {
  @override
  _NotificationBarState createState() => _NotificationBarState();
}

class _NotificationBarState extends State<NotificationBar> {
  int _selectedIndex =
      0; // Asegúrate de que _selectedIndex esté aquí y sea accesible

  static List<Widget> _widgetOptions = <Widget>[
    NotificationScreen(),
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
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> notifications = [
    'Tu evento está por comenzar',
    'El próximo evento empieza en 20 minutos, no faltes',
    'Tu evento empieza mañana',
    'Este jueves comienza tu evento',
    'El próximo evento empieza en 1 hora, no faltes',
    'Tu evento está próximo a empezar',
  ];

  Future<void> _refreshNotifications() async {
    // Simulate fetching new data
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      notifications = List.from(notifications); // Refresh list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 213, 170, 255),
        title: Text('Notificaciones'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChip(
                    label: Text('Hoy'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 10),
                  FilterChip(
                    label: Text('Próximo'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 10),
                  FilterChip(
                    label: Text('Mañana'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 10),
                  FilterChip(
                    label: Text('2:20'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 10),
                  FilterChip(
                    label: Text('13:30'),
                    onSelected: (bool value) {},
                  ),
                  SizedBox(width: 10),
                  FilterChip(
                    label: Text('10:00'),
                    onSelected: (bool value) {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshNotifications,
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(notifications[index]),
                    onDismissed: (direction) {
                      setState(() {
                        notifications.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Notificación eliminada')),
                      );
                    },
                    background:
                        Container(color: Color.fromARGB(255, 255, 255, 255)),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: ListTile(
                        title: Text(notifications[index]),
                        trailing: Icon(Icons.notifications),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
