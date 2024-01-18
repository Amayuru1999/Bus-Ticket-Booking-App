import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  generateQRCodeImage(String data) {
    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
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
                  SizedBox(height: 10),
                  // ... existing ticket information

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
                    'QR Code:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  generateQRCodeImage(generateTicketID()),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
