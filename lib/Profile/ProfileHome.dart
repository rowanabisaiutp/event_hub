import 'package:digital_event_hub/Profile/ProfileEdit.dart';
import 'package:flutter/material.dart';

class ProfileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: NavbarClipper(),
                  child: Container(
                    height: 265.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFD36AE4), Color(0x42E894BC)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 100.0,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 1),
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    const Text(
                      'Eider Pool',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'John@gmail.com',
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileEdith()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 214, 113, 229),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ), // Color del botón
                      ),
                      child: const Text(
                        'Editar Perfil',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    const SizedBox(height: 42.0),
                    const Text(
                      'Numero de telefono',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '+52(999)929737',
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Contraseña',
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '****************',
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 90.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.blue.shade100,
                        ),
                        const SizedBox(width: 10.0),
                        CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.pink.shade100,
                        ),
                        const SizedBox(width: 10.0),
                        CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.purple.shade100,
                        ),
                        const SizedBox(width: 10.0),
                        const CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.purple,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 83.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 214, 113, 229),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ), // Color del botón
                      ),
                      child: const Text(
                        'Cerrar sesión',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
