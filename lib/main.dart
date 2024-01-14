import 'package:busticketbooking/bus_booking_detail_page.dart';
import 'package:busticketbooking/bus_booking_main_page.dart';
import 'package:busticketbooking/bus_booking_select_page.dart';
import 'package:busticketbooking/home_page.dart';
import 'package:busticketbooking/login_page.dart';
import 'package:busticketbooking/sign_up_page.dart';
import 'package:busticketbooking/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blueAccent,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => const SplashScreen(
              child: BusBookingDetailPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/bus_booking_main_page': (context) => const BusBookingMainPage(),
        '/detail': (context) => BusBookingDetailPage(),
        '/seat': (context) => BusBookingSelectPage()
      },
    );
  }
}
