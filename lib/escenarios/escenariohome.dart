import 'package:digital_event_hub/escenarios/asientos.dart';
import 'package:digital_event_hub/escenarios/symbology.dart';
import 'package:digital_event_hub/reviews/eventBuy.dart';
import 'package:flutter/material.dart';

class Escenariohome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenemos el tamaño de la pantalla
    final Size screenSize = MediaQuery.of(context).size;
    // Calculamos el padding horizontal de manera proporcional al tamaño de la pantalla
    final double horizontalPadding = screenSize.width * 0.2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text('Selecciona tus asientos',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 24, bottom: 0, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Eventbuy(),
            const SizedBox(height: 16.0),
            const Divider(
              height: 40,
              color: Colors.grey,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Center(
              child: Symbology(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Asientos(),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Confirmar asientos',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
