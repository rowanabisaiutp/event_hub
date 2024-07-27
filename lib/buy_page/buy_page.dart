import 'package:digital_event_hub/reviews/eventBuy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:digital_event_hub/buy_page/buy.dart'; // Asegúrate de tener esta importación si es necesario

class MetodoPagoScreen extends StatelessWidget {
      final int id;

  const MetodoPagoScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text('Selecciona tu metodo de pago',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white, // Establecer color de fondo a blanco
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Eventbuy(id:id),
            SizedBox(height: 20),
            PaymentOption(
              icons: [
                'assets/mastercard.png', // Reemplaza con la ruta de tu imagen
                'assets/visa.png', // Reemplaza con la ruta de tu imagen
                'assets/banco_azteca.jpg' // Reemplaza con la ruta de tu imagen
              ],
              text: 'Click to Pay',
              onTap: () {
                _showUnavailableMessage(context);
              },
            ),
            PaymentOption(
              icons: [
                'assets/tarjeta_bancaria.png'
              ], // Reemplaza con la ruta de tu imagen
              text: 'Tarjeta bancaria',
              onTap: () {
                _showUnavailableMessage(context);
              },
            ),
            PaymentOption(
              icons: [
                'assets/pay_pal.png'
              ], // Reemplaza con la ruta de tu imagen
              text: 'Pay Pal',
              onTap: () {
                _showUnavailableMessage(context);
              },
            ),
            PaymentOption(
              icons: [
                'assets/stripe.png'
              ], // Reemplaza con la ruta de tu imagen
              text: 'Stripe',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentFormScreen()),
                );
              },
            ),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '\$00.00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '\$00.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showUnavailableMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Este metodo de pago aun no esta disponible')),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final List<String> icons;
  final String text;
  final VoidCallback onTap;

  PaymentOption({required this.icons, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 222, 222, 222)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Row(
              children: icons
                  .map((icon) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          icon,
                          width: 32,
                          height: 32,
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
