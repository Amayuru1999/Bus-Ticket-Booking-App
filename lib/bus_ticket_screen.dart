import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BusTicketScreen extends StatefulWidget {
  @override
  _BusTicketScreenState createState() => _BusTicketScreenState();
}

class _BusTicketScreenState extends State<BusTicketScreen> {
  late DateTime bookedTimeSeats = DateTime.now();
  late int seatCount = 0;
  late List<int> seatNumbers = []; // Initialize as an empty list

  late DateTime bookedTimeBookings = DateTime.now();
  late String from = '';
  late String to = '';
  late int passengers = 0;
  late String selectedDate = '';
  late String selectedTime = '';
  late String tripType = '';

  @override
  void initState() {
    super.initState();
    fetchBusTicketData();
  }

  Future<void> fetchBusTicketData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Fetch data from 'seats' collection
      final userSeatDoc = await FirebaseFirestore.instance
          .collection('seats')
          .doc(user.uid)
          .get();

      if (userSeatDoc.exists) {
        final seatsData = userSeatDoc.data() as Map<String, dynamic>;

        // Convert Timestamp to String
        final bookedTime = seatsData['bookedTime'] as Timestamp;
        final bookedTimeString = bookedTime.toDate().toString();

        setState(() {
          bookedTimeSeats = DateTime.parse(bookedTimeString);
          seatCount = seatsData['seatCount'] ?? 0;
          seatNumbers = List<int>.from(seatsData['seatNumbers'] ?? []);
        });
      }

      // Fetch data from 'bookings' collection
      final userBookingDoc = await FirebaseFirestore.instance
          .collection('bookings')
          .doc(user.uid)
          .get();

      if (user != null) {
        // Fetch data from 'bookings' collection
        final userBookingDoc = await FirebaseFirestore.instance
            .collection('bookings')
            .doc(user.uid)
            .get();

        if (userBookingDoc.exists) {
          final bookingsData = userBookingDoc.data() as Map<String, dynamic>;
          print('Bookings Data: $bookingsData');

          // Convert Timestamp to String
          final bookedTimeBooking = bookingsData['timestamp'] as Timestamp;
          final bookedTimeBookingString = bookedTimeBooking.toDate().toString();

          setState(() {
            // bookedTimeBookings = DateTime.parse(bookedTimeBookingString);
            from = bookingsData['from'];
            to = bookingsData['to'];
            passengers = bookingsData['passengers'] ?? 0;
            selectedDate = bookingsData['selectedDate'];
            selectedTime = bookingsData['selectedTime'];
            tripType = bookingsData['tripType'];
          });
        } else {
          print(
              'No data found in the "bookings" collection for user: ${user.uid}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Ticket'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Seats Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Booked Time: ${bookedTimeSeats.toLocal()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Seat Count: $seatCount',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Seat Numbers: ${seatNumbers.join(', ')}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bookings Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Booked Time: ${bookedTimeBookings.toLocal()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'From: $from',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'To: $to',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Passengers: $passengers',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Selected Date: $selectedDate',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Selected Time: $selectedTime',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Trip Type: $tripType',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement any action you want when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Change button color to red
                    ),
                    child: Text(
                      'Cancel Booking',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
