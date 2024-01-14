import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'bus_booking_home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ui';

class BusBookingDetailPage extends StatefulWidget {
  const BusBookingDetailPage({Key? key}) : super(key: key);

  @override
  State<BusBookingDetailPage> createState() => _BusBookingDetailPageState();
}

class _BusBookingDetailPageState extends State<BusBookingDetailPage> {
  List<List<dynamic>> csvData = [];

  @override
  void initState() {
    super.initState();
    // Call the function to fetch and parse CSV data when the widget is created.
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Get the download URL for the CSV file in Firebase Storage.
      String downloadUrl = await getCSVDownloadUrl("Bus Data - Sheet1.csv");

      // Fetch the CSV data from the download URL.
      final response = await http.get(Uri.parse(downloadUrl));

      // Check if the response is successful (status code 200).
      if (response.statusCode == 200) {
        // Parse the CSV data from the response body.
        List<List<dynamic>> parsedData =
            CsvToListConverter().convert(response.body);

        // Exclude the first row (headers).
        csvData = parsedData.sublist(1);

        // Update the state with the parsed CSV data.
        setState(() {});
      } else {
        // Handle non-successful HTTP responses.
        print("Error fetching CSV data. Status Code: ${response.statusCode}");
      }
    } catch (error) {
      // Handle errors appropriately.
      print("Error fetching CSV data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        title: const Text(
          "Available Buses!",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 64,
            color: Colors.blue,
          ),
          const Divider(),

          // Display CSV data in Cards
          for (var row in csvData)
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text('Bus ID: ${row[0]}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bus Type: ${row[1]}'),
                    Text('From: ${row[2]}'),
                    Text('To: ${row[3]}'),
                    Text('Arrival Time: ${row[4]}'),
                    Text('Departure Time: ${row[5]}'),
                    Text('Driver Id: ${row[6]}'),
                  ],
                ),
              ),
            ),

          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/seat");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "12.90 €",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: " per ticket",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> getCSVDownloadUrl(String fileName) async {
  Reference reference = FirebaseStorage.instance.ref().child(fileName);
  return await reference.getDownloadURL();
}

Future<List<List<dynamic>>> parseCSVFromUrl(String url) async {
  final response = await http.get(Uri.parse(url));
  final String csvString = response.body;
  return CsvToListConverter().convert(csvString);
}
