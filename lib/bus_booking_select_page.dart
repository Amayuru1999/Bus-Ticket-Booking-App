import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BusBookingSelectPage extends StatefulWidget {
  const BusBookingSelectPage({super.key});

  @override
  State<BusBookingSelectPage> createState() => _BusBookingSelectPageState();
}

class _BusBookingSelectPageState extends State<BusBookingSelectPage> {
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
                    color: Colors.orange,
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
                // Container(
                //   height: 32,
                //   width: 32,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[400],
                //     borderRadius: BorderRadius.circular(4),
                //   ),
                //   child: const Center(
                //     child: Icon(
                //       Icons.clear,
                //     ),
                //   ),
                // ),
                // const Text(
                //   "Taken",
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 15,
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '1',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '2',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '3',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '4',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '5',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '6',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '7',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '8',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '9',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '10',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '11',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '12',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '13',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '14',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '15',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '16',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '17',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '18',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '19',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '20',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '21',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '22',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '23',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '24',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '25',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '26',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '27',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '28',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '29',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '30',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '31',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '32',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '33',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '34',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '35',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '36',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '37',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '38',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '39',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '40',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '41',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '42',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '43',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '44',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '45',
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '46',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '47',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '48',
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
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '49',
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
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/seat.png', // Replace with the actual path to your image asset
                                    fit: BoxFit
                                        .contain, // Adjust the BoxFit as needed
                                  ),
                                ),
                                const Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '50',
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
                const Text(
                  "Seat: 1/1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32),
                    ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TakenSeatComponent extends StatelessWidget {
  const _TakenSeatComponent({
    this.marginRight = 0.0,
  });
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight ?? 0),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.grey[400]!,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Icon(
          Icons.clear,
        ),
      ),
    );
  }
}

class _GeneralSeatComponent extends StatelessWidget {
  final String? title;
  final Color borderColor;
  final double? marginRight;

  const _GeneralSeatComponent({
    this.title,
    this.borderColor = Colors.red,
    this.marginRight = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.only(
        right: marginRight ?? 0,
      ),
      child: Center(
        child: Text(
          "$title",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
