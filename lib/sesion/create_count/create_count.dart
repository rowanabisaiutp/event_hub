import 'package:digital_event_hub/sesion/login/login.dart';
import 'package:flutter/material.dart';

class CreateCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.jpg',
                    height: 70,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Crear cuenta',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color.fromARGB(255, 137, 64, 255),
                          // Añade esta línea para alinear el texto a la izquierda
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Dato 1',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Dato 2',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Dato 3',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Dato 1',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Dato 1',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Dato 1',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GradientButton(
                    text: 'Crear cuenta',
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 212, 172, 255),
                        Color.fromARGB(255, 162, 0, 255)
                      ],
                    ),
                    onPressed: () {
                      //
                    },
                  ),
                  const SizedBox(height: 10),
                  GradientButton(
                    text: 'Ya tengo una cuenta',
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 153, 0, 255),
                        Color.fromARGB(255, 218, 163, 255)
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
