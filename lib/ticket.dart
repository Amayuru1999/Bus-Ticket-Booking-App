import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:barcode_widget/barcode_widget.dart';

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  late DateTime bookedTimeSeats = DateTime.now();
  late int seatCount = 0;
  late List<int> seatNumbers = [];

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
    fetchTicketData();
  }

  Future<void> fetchTicketData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        final userSeatDoc = await FirebaseFirestore.instance
            .collection('seats')
            .doc(user.uid)
            .get();

        if (userSeatDoc.exists) {
          final seatsData = userSeatDoc.data() as Map<String, dynamic>;
          final bookedTime = seatsData['bookedTime'] as Timestamp;
          final bookedTimeString = bookedTime.toDate().toString();

          setState(() {
            bookedTimeSeats = DateTime.parse(bookedTimeString);
            seatCount = seatsData['seatCount'] ?? 0;
            seatNumbers = List<int>.from(seatsData['seatNumbers'] ?? []);
          });
        }

        final userBookingDoc = await FirebaseFirestore.instance
            .collection('bookings')
            .doc(user.uid)
            .get();

        if (userBookingDoc.exists) {
          final bookingsData = userBookingDoc.data() as Map<String, dynamic>;
          final bookedTimeBooking = bookingsData['timestamp'] as Timestamp;
          final bookedTimeBookingString = bookedTimeBooking.toDate().toString();

          setState(() {
            bookedTimeBookings = DateTime.parse(bookedTimeBookingString);
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
      } catch (e, stackTrace) {
        print('Error fetching ticket data: $e');
        print(stackTrace);
      }
    }
  }

  String generateTicketID() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  generateCodeImages(String data) {
    return Column(
      children: [
        Text(
          'QR Code:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        QrImageView(
          data: data,
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        ),
        SizedBox(height: 20),
        Text(
          'Barcode:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        BarcodeWidget(
          barcode: Barcode.code128(),
          color: Colors.black,
          data: data,
          width: 200,
          height: 50,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Go Payment Invoice'),
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
                  Image.asset(
                    'assets/logo.png', // Replace 'your_logo.png' with your actual logo asset path
                    height: 100,
                    width: 400, // Adjust the height as needed
                  ),

                  Text(
                    'Ticket ID: ${generateTicketID()}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 20,
                  ),
                  Text(
                    'TRAVEL DETAILS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Display additional travel details
                  Text('Boarding: $from'),
                  Text('Dropping: $to'),
                  Text('Date: $selectedDate'),
                  Text('Time: $selectedTime'),
                  Text('Passengers: $passengers'),
                  Text('Trip Type: $tripType'),

                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 20,
                  ),
                  Text(
                    'SEATES BOOKED',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Display seat information
                  Text('Seat Count: $seatCount'),
                  Text('Seat Numbers: ${seatNumbers.join(', ')}'),

                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 20,
                  ),
                  Text(
                    'BOOKING TIMESTAMP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Display booking timestamps
                  Text('Seats Booked Time: $bookedTimeSeats'),
                  Text('Booking Time: $bookedTimeBookings'),

                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 20,
                  ),
                  generateCodeImages(generateTicketID()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
