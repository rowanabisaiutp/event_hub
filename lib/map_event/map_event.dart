import 'package:digital_event_hub/notification/notif.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;

  final LatLng _center =
      const LatLng(20.5850752, -90.0223038); // Coordenadas de ejemplo

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de eventos cercanos'),
        backgroundColor: Color.fromARGB(255, 255, 87, 252),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationBar()),
          );
        },
        child: Icon(Icons.notifications_none),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
