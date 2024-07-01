import 'package:digital_event_hub/Profile/ProfileHome.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola, Eider',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF888888),
              ),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileHome()),
            );
          },
          child: const CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
        ),
      ],
    );
  }
}
