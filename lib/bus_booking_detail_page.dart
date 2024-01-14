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
            InkWell(
              onHover: (isHovered) {
                // Add hover effect
                setState(() {
                  // You can use the isHovered boolean to change the appearance
                });
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: const Color.fromARGB(255, 216, 216,
                    216), // Set background color based on service type
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: getServiceColor(row[
                            1]), // Set background color based on service type
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius as needed
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '${row[1]}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('From: ${row[2]}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('To: ${row[3]}'),
                          Text('Arrival Time: ${row[4]}'),
                          Text('Departure Time: ${row[5]}'),
                          Text('Driver Id: ${row[6]}'),
                          Text('Bus No.: ${row[0]}'),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle button tap

                        Navigator.pushNamed(context, "/seat");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue, // Set the color of the button
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Book',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          const Divider(),
        ],
      ),
    );
  }

  Color getServiceColor(String serviceType) {
    // Determine color based on service type
    switch (serviceType.toLowerCase()) {
      case 'semi luxury':
        return Colors.lightBlue;
      case 'luxury':
        return Colors.lightGreen;
      case 'super luxury':
        return Colors.purple;
      default:
        // Default color for Normal Services
        return Colors.red;
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
}
