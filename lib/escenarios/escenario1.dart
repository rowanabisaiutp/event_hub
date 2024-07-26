import 'package:digital_event_hub/buy_page/buy_page.dart';
import 'package:digital_event_hub/escenarios/asientos.dart';
import 'package:digital_event_hub/escenarios/symbology.dart';
import 'package:digital_event_hub/reviews/eventBuy.dart';
import 'package:flutter/material.dart';

class Escenario1 extends StatelessWidget {
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
            Eventbuy(), //Componente de la compra
            const SizedBox(height: 20.0),

            Center(
              child: Symbology(), //Componente de la simbologia
            ),
            const SizedBox(height: 80),
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    //Imagen solo del escenario
                    'assets/stage.png',
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: Asientos(), //Componente de los asientos
                    ),
                  ),
                ],
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
                            builder: (context) => MetodoPagoScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 16),
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
