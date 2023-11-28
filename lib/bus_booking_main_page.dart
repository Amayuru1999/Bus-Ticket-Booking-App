import 'package:busticketbooking/bus_booking_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final busTicketAppMenuIndex = StateProvider<int>((ref) => 0);

class BusBookingMainPage extends StatefulWidget {
  const BusBookingMainPage({super.key});

  @override
  State<BusBookingMainPage> createState() => _BusBookingMainPageState();
}

class _BusBookingMainPageState extends State<BusBookingMainPage> {
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
              const BusBookingHomeScreen(),
              Center(
                child: Text("$index"),
              ),
              Center(
                child: Text("$index"),
              ),
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
