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
      try {
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

        if (userBookingDoc.exists) {
          final bookingsData = userBookingDoc.data() as Map<String, dynamic>;

          // Convert Timestamp to String
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
        print('Error fetching bus ticket data: $e');
        print(stackTrace);
        // Handle the error as needed (e.g., show a message to the user)
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
                  SizedBox(height: 10),
                  Text(
                    'Boarding: $from',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 32, 8, 255),
                    ),
                  ),
                  Text(
                    'Dropping: $to',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 32, 8, 255),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 20,
                  ),
                  Text(
                    'Seat Numbers: ${seatNumbers.join(', ')}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Seat Count: $seatCount',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Passengers: $passengers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 20,
                  ),
                  Text(
                    'Selected Date: $selectedDate',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Selected Time: $selectedTime',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   'Trip Type: $tripType',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //   ),
                  // ),
                  Text(
                    'Booked Time: ${bookedTimeSeats.toLocal()}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/payment");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 8, 177, 255),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      elevation: 5,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_bus_filled,
                          size: 30,
                          color: Colors.black,
                        ), // Set the size to match the font size
                        SizedBox(width: 20),
                        Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                            width: 20), // Add spacing between text and arrow
                        Icon(
                          Icons.arrow_circle_right_sharp,
                          size: 40,
                          color: Colors.black,
                        ), // Set the size to match the font size
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      // Implement any action you want when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Change button color to red
                    ),
                    child: const Text(
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
