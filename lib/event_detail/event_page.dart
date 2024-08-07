import 'dart:ui'; // Importa ImageFilter para aplicar el filtro de desenfoque
import 'package:digital_event_hub/escenarios/escenario1.dart'; //<-------------------- Importa la clase Escenario1
import 'package:digital_event_hub/event_detail/comentarios.dart'; // Asegúrate de que la ruta es correcta
import 'package:digital_event_hub/home/eventsList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:digital_event_hub/event_detail/ApiServiceEvent.dart';
import 'package:share_plus/share_plus.dart';

// Definición de la página del evento
class EventPage extends StatefulWidget {
  final int id; // Identificador del evento

  const EventPage(
      {super.key,
      this.id = 2}); // Valor predeterminado 2 si no se proporciona ninguno

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> with TickerProviderStateMixin {
  Map<String, dynamic>? event; // Variable para almacenar los datos del evento
  int get id => widget.id; // Obtén el id del evento

  @override
  void initState() {
    super.initState();
    fetchEventById(id); // Llama a la función para obtener los datos del evento
  }

  // Función para obtener los datos del evento
  void fetchEventById(int eventId) async {
    try {
      List<dynamic> fetchedEvents =
          await ApiServiceEvent().fetchEvents(); // Obtén la lista de eventos
      Map<String, dynamic>? fetchedEvent = fetchedEvents.firstWhere(
          (e) => e['evento_id'] == eventId,
          orElse: () => null); // Filtra el evento por id
      setState(() {
        event = fetchedEvent; // Actualiza el estado con el evento obtenido
        print(event); // Imprime el evento para depuración
      });
    } catch (e) {
      print("Failed to load event: $e"); // Manejo de errores
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EventsList()), // Navega a la lista de eventos
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () async {
              await Share.share(
                  'Hola, te invito a este evento: ${event!['nombre_evento']} en ${event!['ubicacion']} el ${event!['fecha_inicio'].substring(0, 10)} a las ${event!['hora']}');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: event != null
                              ? Image.network(
                                  event!['imagen_url'] ??
                                      'https://imgs.search.brave.com/SEEkteBkeBAROk-PRhtRO0sSp-e3N8eXgAZvfMwFpm4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9paDEu/cmVkYnViYmxlLm5l/dC9pbWFnZS40ODU5/MjM2NjEuMTI0MC9i/ZyxmOGY4ZjgtZmxh/dCw3NTB4LDA3NSxm/LXBhZCw3NTB4MTAw/MCxmOGY4ZjgudTEu/anBn', // URL de imagen por defecto si no está disponible en el evento
                                  width: double.infinity,
                                  height: 500,
                                  fit: BoxFit.cover,
                                )
                              : const CircularProgressIndicator(), // Muestra un indicador de carga mientras se obtienen los datos
                        ),
                        Positioned(
                          bottom: 30,
                          left: 20,
                          right: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 40,
                                  sigmaY: 40), // Aplica el desenfoque
                              child: Container(
                                padding: const EdgeInsets.all(25.0),
                                decoration: BoxDecoration(
                                  color: const Color(
                                      0x4D1D1D1D), // Color con 30% de opacidad
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event != null
                                          ? event!['nombre_evento'] ?? 'Evento'
                                          : 'Evento',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage('assets/Pin.png'),
                                          height: 15,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          event != null
                                              ? event!['ubicacion'] ??
                                                  'Ubicación'
                                              : 'Ubicación',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      event != null
                                          ? "${event!['fecha_inicio']?.substring(0, 10)}"
                                          : 'Fecha',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      event != null
                          ? 'Maximo de personas: ${event!['max_per']}'
                          : 'Maximo de personas: Desconocido',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(width: 4),
                        Text(event != null
                            ? 'Hora: ${event!['hora']}'
                            : 'Hora: Desconocida'),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.commentDots),
                              iconSize: 30.0,
                              onPressed: () {
                                Comentarios(context, this,
                                    id); // Se pasó el id como parámetro //<-------------------- Modificado
                              },
                            ),
                            Icon(Icons.star,
                                size: 35,
                                color: Color.fromARGB(255, 255, 238, 0)),
                            Text(
                              '4.8',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                        event != null
                            ? 'Organizado por: ${event!['organizador_nombre'] ?? 'Desconocido'}\n\nTipo de evento: ${event!['tipo_evento'] ?? 'Desconocido'}\nCategoría: ${event!['categoria_nombre'] ?? 'Desconocida'}'
                            : 'Descripción no disponible',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.4,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Escenario1(
                          id: id), // Pasar el id //<-------------------- Modificado
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.send, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
