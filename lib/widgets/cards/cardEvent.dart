import 'package:flutter/material.dart';


class CardEvent extends StatelessWidget {
  final String title;
  final String img;
  final String ubication;
  final String date;
  final String id;

  // Constructor
  CardEvent(
    this.title,
    this.img,
    this.ubication,
    this.date,
    this.id
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            img, // URL de la imagen
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey, size: 17.0),
                        SizedBox(width: 4.0),
                        Text(
                          ubication,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.grey, size: 17.0),
                        SizedBox(width: 4.0),
                        Text(
                          date,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                


              ],
            ),
          ),
        ],
      ),
    );
  }
}
