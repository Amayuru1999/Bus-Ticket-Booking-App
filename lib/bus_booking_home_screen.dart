import 'package:busticketbooking/bus_booking_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BusBookingHomeScreen extends StatefulWidget {
  const BusBookingHomeScreen(Text text, {super.key});

  @override
  State<BusBookingHomeScreen> createState() => _BusBookingHomeScreenState();
}

class BusData {
  final String bookedTime;
  final String from;
  final int passengers;
  final String selectedDate;
  final String selectedTime;
  final Timestamp timestamp;
  final String to;
  final String tripType;

  BusData({
    required this.bookedTime,
    required this.from,
    required this.passengers,
    required this.selectedDate,
    required this.selectedTime,
    required this.timestamp,
    required this.to,
    required this.tripType,
  });
  static BusData fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    return BusData(
      bookedTime: data['bookedTime'],
      from: data['from'],
      passengers: data['passengers'],
      selectedDate: data['selectedDate'],
      selectedTime: data['selectedTime'],
      timestamp: data['timestamp'],
      to: data['to'],
      tripType: data['tripType'],
    );
  }
}

class _BusBookingHomeScreenState extends State<BusBookingHomeScreen> {
  List<BusData> busDataList = [];
  bool tripType = false;
  int _counter = 0;
  final TextEditingController _fromTec = TextEditingController();
  final TextEditingController _toTec = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Book tickets for your",
              style: GoogleFonts.montserrat(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "next trip",
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 32),
                height: 58,
                width: MediaQuery.of(context).size.width - 160,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tripType = true;
                          });
                        },
                        child: tripType
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: const Center(
                                  child: Text(
                                    "One Way",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "One Way",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tripType = false;
                          });
                        },
                        child: !tripType
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Round Trip",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Round Trip",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "From",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _fromTec,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 0),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "To",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _toTec,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    top: 16,
                    child: GestureDetector(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: const Center(
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          child: Icon(
                            Icons.access_time,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Set Date and Time!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDateTime(context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedDate != null
                              ? "Date-${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}"
                              : "Date & Time",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Text(
                        //   selectedTime != null
                        //       ? "Time -${selectedTime!.hour}:${selectedTime!.minute}"
                        //       : "Set time",
                        //   style: const TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 20,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Passengers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _counter--;
                          if (_counter <= 1) _counter = 1;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.remove,
                          color: _counter == 1 ? Colors.grey : Colors.black,
                        ),
                      ),
                      Text(
                        "$_counter",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _counter++;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            const Text(
              "Do you have promocode?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            GestureDetector(
              onTap: () async {
                await saveBookingData();
                // Clear text fields
                _fromTec.clear();
                _toTec.clear();

                // Reset date and time selections
                setState(() {
                  selectedDate = null;
                  selectedTime = null;
                });
                // Save data to Firestore
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusBookingDetailPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(48),
                ),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Search for Trips",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = pickedDate;
          selectedTime = pickedTime;
        });
      }
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> saveBookingData() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the Firestore collection

      CollectionReference bookings =
          FirebaseFirestore.instance.collection('bookings');

      // Get the current time
      DateTime currentTime = DateTime.now();
      Timestamp timestamp = Timestamp.fromDate(currentTime);

      // Create a map representing the booking data
      Map<String, dynamic> bookingData = {
        'userId': user.uid, // Include user ID in the document
        'tripType': tripType ? 'One Way' : 'Round Trip',
        'from': _fromTec.text,
        'to': _toTec.text,
        'selectedDate': selectedDate?.toIso8601String(),
        'selectedTime': selectedTime?.format(context),
        'passengers': _counter,
        'bookedTime': currentTime.toIso8601String(),
        'timestamp': timestamp,
      };
// Use the user's UID as the document ID
      String documentId = user.uid;
      // Add the data to the Firestore collection with the specified document ID
      await bookings.doc(documentId).set(bookingData);
    } else {
      // Handle the case where the user is not authenticated
      print('User is not authenticated.');
    }
    Future<void> fetchBusData() async {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Reference to the Firestore collection
        CollectionReference bookings =
            FirebaseFirestore.instance.collection('bookings');

        // Fetch the data based on user preferences
        QuerySnapshot querySnapshot = await bookings
            .where('userId', isEqualTo: user.uid)
            .where('from', isEqualTo: _fromTec.text)
            .where('to', isEqualTo: _toTec.text)
            .where('selectedDate', isEqualTo: selectedDate?.toIso8601String())
            .where('selectedTime', isEqualTo: selectedTime?.format(context))
            .get();

        // Clear existing busDataList
        busDataList.clear();

        // Iterate through query results and add to busDataList
        querySnapshot.docs.forEach((document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;

          // Add the relevant bus data to the list
          busDataList.add(BusData(
            bookedTime: data['bookedTime'],
            from: data['from'],
            passengers: data['passengers'],
            selectedDate: data['selectedDate'],
            selectedTime: data['selectedTime'],
            timestamp: data['timestamp'],
            to: data['to'],
            tripType: data['tripType'],
          ));
        });

        // Trigger a rebuild
        setState(() {});
      }
    }
  }
}
