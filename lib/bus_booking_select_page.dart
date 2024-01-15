import 'package:busticketbooking/my_clickable_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'clickable_seat.dart';

class BusBookingSelectPage extends StatefulWidget {
  const BusBookingSelectPage({Key? key}) : super(key: key);

  @override
  State<BusBookingSelectPage> createState() => _BusBookingSelectPageState();
}

class _BusBookingSelectPageState extends State<BusBookingSelectPage> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Select Seat"),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, "/detail");
          },
          color: Colors.red,
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text(
                  "Booked",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text(
                  "Available",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClickableSeat(seatNumber: '1'),
                          ClickableSeat(seatNumber: '2'),
                          SizedBox(width: 20),
                          ClickableSeat(seatNumber: '3'),
                          ClickableSeat(seatNumber: '4'),
                          ClickableSeat(seatNumber: '5'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ClickableSeat(seatNumber: '6'),
                          ClickableSeat(seatNumber: '7'),
                          SizedBox(width: 20),
                          ClickableSeat(seatNumber: '8'),
                          ClickableSeat(seatNumber: '9'),
                          ClickableSeat(seatNumber: '10'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ClickableSeat(seatNumber: '11'),
                          ClickableSeat(seatNumber: '12'),
                          SizedBox(width: 20),
                          ClickableSeat(seatNumber: '13'),
                          ClickableSeat(seatNumber: '14'),
                          ClickableSeat(seatNumber: '15'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ClickableSeat(seatNumber: '16'),
                          ClickableSeat(seatNumber: '17'),
                          SizedBox(width: 20),
                          ClickableSeat(seatNumber: '18'),
                          ClickableSeat(seatNumber: '19'),
                          ClickableSeat(seatNumber: '20'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ClickableSeat(seatNumber: '21'),
                          ClickableSeat(seatNumber: '22'),
                          SizedBox(width: 20),
                          ClickableSeat(seatNumber: '23'),
                          ClickableSeat(seatNumber: '24'),
                          ClickableSeat(seatNumber: '25'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ClickableSeat(seatNumber: '26'),
                          ClickableSeat(seatNumber: '27'),
                          SizedBox(width: 20),
                          ClickableSeat(seatNumber: '28'),
                          ClickableSeat(seatNumber: '29'),
                          ClickableSeat(seatNumber: '30'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ClickableSeat(seatNumber: '31'),
                          ClickableSeat(seatNumber: '32'),
                          SizedBox(width: 20),
                          ClickableSeat(seatNumber: '33'),
                          ClickableSeat(seatNumber: '34'),
                          ClickableSeat(seatNumber: '35'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ClickableSeat(seatNumber: '36'),
                          ClickableSeat(seatNumber: '37'),
                          SizedBox(width: 20),
                          ClickableSeat(seatNumber: '38'),
                          ClickableSeat(seatNumber: '39'),
                          ClickableSeat(seatNumber: '40'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 150),
                          ClickableSeat(seatNumber: '41'),
                          ClickableSeat(seatNumber: '42'),
                          ClickableSeat(seatNumber: '43'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          MyClickableBox(seatNumber: '44'),
                          MyClickableBox(seatNumber: '45'),
                          MyClickableBox(seatNumber: '46'),
                          MyClickableBox(seatNumber: '47'),
                          MyClickableBox(seatNumber: '48'),
                          MyClickableBox(seatNumber: '49'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomAppBar(
          elevation: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 17, 168, 255),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: InkWell(
                      onTap: () {
                        _confirmSeats();
                      },
                      child: const Center(
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _confirmSeats() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && selectedSeats.isNotEmpty) {
      final batch = FirebaseFirestore.instance.batch();

      // Generate a timestamp for the bookedTime field
      final bookedTime = Timestamp.now();

      // Calculate seatCount and seatNumbers based on selectedSeats
      final seatCount = selectedSeats.length;
      final seatNumbers =
          selectedSeats.map((seatNumber) => int.parse(seatNumber)).toList();

      // Combine seat numbers into a string
      final seatNumbersString = seatNumbers.join(', ');

      // Create a unique booking ID using a combination of user ID and timestamp
      final bookingId = "${user.uid}_${bookedTime.seconds}";

      // Update each selected seat with the booking details
      for (final seatNumber in selectedSeats) {
        batch.set(
          FirebaseFirestore.instance.collection('seats').doc(seatNumber),
          {
            'bookedTime': bookedTime,
            'seatCount': seatCount,
            'seatNumbers': seatNumbersString,
            'userId': user.uid,
            'bookingId': bookingId,
          },
        );
      }

      // Remove deselected seats from the seatNumbers field
      final allSeats =
          await FirebaseFirestore.instance.collection('seats').get();

      for (final seatDoc in allSeats.docs) {
        final seatNumber = int.parse(seatDoc.id);

        if (!selectedSeats.contains(seatNumber.toString())) {
          batch.update(
            FirebaseFirestore.instance
                .collection('seats')
                .doc(seatNumber.toString()),
            {
              'seatNumbers': FieldValue.arrayRemove([seatNumber]),
            },
          );
        }
      }

      await batch.commit();
    } else {
      // Handle the case when the user is not logged in or no seats are selected
    }
  }
}
