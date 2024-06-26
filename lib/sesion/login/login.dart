import 'package:digital_event_hub/map_event/map_event.dart';
import 'package:digital_event_hub/sesion/create_count/create_count.dart';
import 'package:digital_event_hub/sesion/recover_pass/recover_pass.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.jpg', // Asegúrate de tener el logo en la carpeta assets
                  height: 250,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo o username...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
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
                SizedBox(height: 0),
                GradientButton(
                  text: 'Ingresar',
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 212, 172, 255),
                      Color.fromARGB(255, 162, 0, 255)
                    ],
                  ),
                  onPressed: () {
                    //
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoogleMapScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                GradientButton(
                  text: 'Crear Cuenta',
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 153, 0, 255),
                      Color.fromARGB(255, 218, 163, 255)
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateCount()));
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundColor: Colors.blue, radius: 20),
                    SizedBox(width: 10),
                    CircleAvatar(backgroundColor: Colors.redAccent, radius: 20),
                    SizedBox(width: 10),
                    CircleAvatar(backgroundColor: Colors.black, radius: 20),
                    SizedBox(width: 10),
                    CircleAvatar(
                        backgroundColor: Colors.blueAccent, radius: 20),
                  ],
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
