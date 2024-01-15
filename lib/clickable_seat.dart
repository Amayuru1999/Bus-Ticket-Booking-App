import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClickableSeat extends StatefulWidget {
  final String seatNumber;

  const ClickableSeat({required this.seatNumber, Key? key}) : super(key: key);

  @override
  _ClickableSeatState createState() => _ClickableSeatState();
}

class _ClickableSeatState extends State<ClickableSeat> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
        _onSeatClicked();
      },
      child: Container(
        height: 48,
        width: 48,
        margin: const EdgeInsets.only(right: 16),
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
                  style: TextStyle(
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

  void _onSeatClicked() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final bookedTime = Timestamp.now();
      final selectedSeatNumber = int.parse(widget.seatNumber);

      // Retrieve existing data for the user's seat document
      final userSeatDoc = await FirebaseFirestore.instance
          .collection('seats')
          .doc(user.uid)
          .get();

      // Check if the user's seat document already exists
      if (userSeatDoc.exists) {
        // User's seat document already exists, update the existing data
        final existingData = userSeatDoc.data() as Map<String, dynamic>;
        List<int> updatedSeatNumbers =
            List<int>.from(existingData['seatNumbers'] ?? []);

        // Check if the seat is already selected
        if (updatedSeatNumbers.contains(selectedSeatNumber)) {
          // Seat is already selected, remove it
          updatedSeatNumbers.remove(selectedSeatNumber);
        } else {
          // Seat is not selected, add it
          updatedSeatNumbers.add(selectedSeatNumber);
        }

        await FirebaseFirestore.instance.collection('seats').doc(user.uid).set({
          'bookedTime': bookedTime,
          'seatCount': updatedSeatNumbers.length,
          'seatNumbers': updatedSeatNumbers,
        });
      } else {
        // User's seat document does not exist, create a new entry
        await FirebaseFirestore.instance.collection('seats').doc(user.uid).set({
          'bookedTime': bookedTime,
          'seatCount': 1,
          'seatNumbers': [selectedSeatNumber],
        });
      }
    } else {
      // Handle the case when the user is not logged in
      // You might want to show a login screen or handle it differently
    }
  }
}
