import 'package:flutter/material.dart';

class Asientos extends StatefulWidget {
  @override
  _AsientosState createState() => _AsientosState();
}

class _AsientosState extends State<Asientos> {
  final int totalSeats = 54; // Número total de asientos
  final int seatsPerRow = 10; // Número de asientos por fila
  Set<int> selectedSeats = Set<int>();

  @override
  Widget build(BuildContext context) {
    int numRows = (totalSeats / seatsPerRow).ceil(); // Número de filas necesarias
    double seatSize = (MediaQuery.of(context).size.width - 20) / seatsPerRow - 12;

    return Column(
      children: List.generate(numRows, (rowIndex) {
        int startSeat = rowIndex * seatsPerRow;
        int endSeat = startSeat + seatsPerRow;
        if (endSeat > totalSeats) {
          endSeat = totalSeats;
        }
        int seatsInRow = endSeat - startSeat;
        double padding = (seatsPerRow - seatsInRow) / 2 * seatSize;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(seatsInRow, (index) {
              int seatIndex = startSeat + index + 1; // Comienza desde 1
              bool isSelected = selectedSeats.contains(seatIndex);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedSeats.remove(seatIndex);
                    } else {
                      selectedSeats.add(seatIndex);
                    }
                  });
                },
                child: Container(
                  width: seatSize,
                  height: seatSize,
                  margin: EdgeInsets.all(2),
                  color: isSelected ? Colors.blue : Colors.grey,
                  child: Center(
                    child: isSelected ? Text(seatIndex.toString(), style: TextStyle(color: Colors.white)) : null,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
