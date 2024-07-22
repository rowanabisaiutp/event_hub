import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Eventbuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Poster image
        Container(
          width: 100,
          height: 110,
          margin: EdgeInsets.only(right: 10),
          child: Image.asset(
            'assets/eventolocal.png',
            fit: BoxFit.cover,
          ),
        ),

        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Blue Man Group',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // Rating and reviews
            Row(
              children: [
                Image(
                  image: AssetImage('assets/Pin.png'),
                  height: 15,
                ),
                SizedBox(width: 4.0),
                Text(
                  'Gran Carpa Santa Fe',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.grey,
                  size: 17.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  '23/02/2024',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.grey,
                  size: 17.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  '18:00 hrs',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
