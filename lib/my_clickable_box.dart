// clickable_seat.dart

import 'package:flutter/material.dart';

class MyClickableBox extends StatefulWidget {
  final String seatNumber;

  const MyClickableBox({required this.seatNumber, Key? key}) : super(key: key);

  @override
  _MyClickableBoxState createState() => _MyClickableBoxState();
}

class _MyClickableBoxState extends State<MyClickableBox> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        height: 48,
        width: 48,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isClicked ? Colors.red : Color.fromARGB(255, 0, 0, 0),
            width: 3,
          ),
          color: isClicked ? Colors.red : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/seat.png', // Replace with the actual path to your image asset
                fit: BoxFit.contain, // Adjust the BoxFit as needed
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  widget
                      .seatNumber, // Use widget.seatNumber here to display the seat number
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
