import 'package:busticketbooking/blocs/payment/payment_bloc.dart';
import 'package:busticketbooking/bus_booking_detail_page.dart';
import 'package:busticketbooking/bus_booking_main_page.dart';
import 'package:busticketbooking/bus_booking_select_page.dart';
import 'package:busticketbooking/bus_ticket_screen.dart';
import 'package:busticketbooking/card_form_screen.dart';
import 'package:busticketbooking/home_page.dart';
import 'package:busticketbooking/login_page.dart';
import 'package:busticketbooking/payment.dart';
import 'package:busticketbooking/blocs/payment/payment_bloc.dart';
import 'package:busticketbooking/sign_up_page.dart';
import 'package:busticketbooking/splash_screen/splash_screen.dart';
import 'package:busticketbooking/ticket.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';
import 'package:busticketbooking/.env';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: BlocProvider(
        create: (context) => PaymentBloc(), // Initialize your PaymentBloc here
        child: MyApp(),
      ),
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
        '/': (context) => SplashScreen(
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/bus_booking_main_page': (context) => const BusBookingMainPage(),
        '/detail': (context) => BusBookingDetailPage(),
        '/seat': (context) => BusBookingSelectPage(),
        '/price': (context) => BusTicketScreen(),
        '/payment': (context) => CardFormScreen(),
        '/ticket': (context) => Ticket()
      },
    );
  }
}
