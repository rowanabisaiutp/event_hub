import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:digital_event_hub/buy_page/buy.dart'; // Asegúrate de tener esta importación si es necesario

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Method',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MetodoPagoScreen(),
    );
  }
}

class MetodoPagoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona tu metodo de pago'),
      ),
      body: Container(
        color: Colors.white, // Establecer color de fondo a blanco
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Mask group.png', // Reemplaza con la URL de tu imagen
                      width: 100,
                      height: 120,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Blue Man Group',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                'Gran Carpa Santa Fe',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                '23/02/2024',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 16),
                              Icon(Icons.access_time,
                                  size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                '18:00',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
