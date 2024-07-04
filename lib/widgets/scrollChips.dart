import 'package:flutter/material.dart';

class ScrollChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
            label: Container(
              width: 70, // Ancho fijo
              alignment: Alignment.center,
              child: Text('Conferencias'),
            ),
            onSelected: (bool value) {},
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            selectedColor: Color(0xFFD36AE4),
            labelStyle: TextStyle(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(width: 10),
          FilterChip(
            label: Container(
              width: 70, // Ancho fijo
              alignment: Alignment.center,
              child: Text('Conciertos'),
            ),
            onSelected: (bool value) {},
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            selectedColor: Color(0xFFD36AE4),
            labelStyle: TextStyle(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(width: 10),
          FilterChip(
            label: Container(
              width: 70, // Ancho fijo
              alignment: Alignment.center,
              child: Text('Deportes'),
            ),
            onSelected: (bool value) {},
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            selectedColor: Color(0xFFD36AE4),
            labelStyle: TextStyle(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(width: 10),
          FilterChip(
            label: Container(
              width: 70, // Ancho fijo
              alignment: Alignment.center,
              child: Text('Teatro'),
            ),
            onSelected: (bool value) {},
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            selectedColor: Color(0xFFD36AE4),
            labelStyle: TextStyle(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          
        ],
      ),
    );
  }
}
