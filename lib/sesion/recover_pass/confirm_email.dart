import 'dart:convert';

import 'package:digital_event_hub/sesion/recover_pass/recover_pass.dart';
import 'package:flutter/material.dart';
import 'package:digital_event_hub/sesion/login/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class ConfirmEmail extends StatelessWidget {
  //const name({super.key});

  final _emailController = TextEditingController();
  final url = Uri.parse('http://10.0.2.2:5000/api/forgot-password/');

  

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cambio de Contraseña'),
          content: Text('La contraseña ha sido cambiada exitosamente.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
                // Aquí puedes añadir cualquier acción adicional que desees realizar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SignInScreen()), // Navega a la página de login
                );
              },
            ),
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                // Aquí puedes añadir cualquier acción adicional que desees realizar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SignInScreen()), // Navega a la página de login
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  height: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Ingrese su e-mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecoverPass(),
                          ));
                    },
                    child: Text(
                      'Olvide mi contraseña',
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ),
                ),
                GradientButton(
                  text: 'Enviar email',
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 212, 172, 255),
                      Color.fromARGB(255, 162, 0, 255)
                    ],
                  ),
                  onPressed: () async {
                    String email = _emailController.text;
                    Map<String, dynamic> data = {
                      'email': email,
                    };
                    String jsonData = jsonEncode(data);

                    final response = await http.post(
                      url,
                      headers: <String, String>{
                        'Content-Type': 'application/json',
                      },
                      body: jsonData,
                    );

                    if (response.statusCode == 200) {
                      // Procesar la respuesta exitosa
                      print('Petición POST exitosa');
                      var decodedResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
                      print('Respuesta: $decodedResponse');
                    } else {
                      // Manejar el error
                      print('Error: ${response.statusCode}');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final VoidCallback onPressed;

  const GradientButton({
    Key? key,
    required this.text,
    required this.gradient,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, // Eliminar el padding predeterminado
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          alignment: Alignment.center,
          width: double
              .infinity, // Hacer que el botón ocupe todo el ancho disponible
          padding: EdgeInsets.symmetric(
              vertical:
                  16.0), // Ajustar el padding vertical para cambiar la altura
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0, // Ajustar el tamaño de la fuente
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
