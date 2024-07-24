import 'package:digital_event_hub/reviews/eventBuy.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
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
        title: const Text('Resumen de Compra',
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
            const SizedBox(height: 36.0),
            const Divider(
              height: 1,
              color: Colors.grey,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 270,
                  height: 270,
                  alignment: Alignment.center,
                  child: QrImageView(
                    data: 'id',
                    version: QrVersions.auto,
                    size: 270,
                    gapless: true,
                    foregroundColor: Theme.of(context).colorScheme.tertiary, 
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                    ),
                    dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square, // Píxeles redondeados
                    ),
                  ),
                ),
              ),
            ),

            Container (
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () { Navigator.pop(context); },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Regresar',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
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
