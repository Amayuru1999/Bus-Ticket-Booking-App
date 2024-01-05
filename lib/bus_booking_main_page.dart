import 'package:busticketbooking/bus_booking_home_screen.dart';
import 'package:busticketbooking/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final busTicketAppMenuIndex = StateProvider<int>((ref) => 0);

class BusBookingMainPage extends StatefulWidget {
  const BusBookingMainPage({super.key});

  @override
  State<BusBookingMainPage> createState() => _BusBookingMainPageState();
}

class _BusBookingMainPageState extends State<BusBookingMainPage> {
  String? userEmail; // Store user's email

  @override
  void initState() {
    super.initState();
    // Retrieve user's email (assuming you're using Firebase Authentication)
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userEmail = user.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final index = ref.watch(busTicketAppMenuIndex);
      return Scaffold(
        body: SafeArea(
          top: true,
          child: IndexedStack(
            index: index,
            children: [
              const BusBookingHomeScreen(
                Text('Your Title Here'),
              ),
              Center(
                child: Text("$index"),
              ),
              const ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            elevation: 4,
            selectedItemColor: const Color.fromARGB(255, 2, 48, 255),
            currentIndex: index,
            onTap: (idx) =>
                ref.read(busTicketAppMenuIndex.notifier).state = idx,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Booking",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.confirmation_number,
                ),
                label: "Tickets",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2,
                ),
                label: "Profile",
              ),
              // label:"Booking",
            ],
          ),
        ),
      );
    });
  }
}
