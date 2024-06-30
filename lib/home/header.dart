import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola, Eider',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
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
        CircleAvatar(
          radius: 24.0,
          backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg'),
        ),
        
      ],
    );
  }
}
