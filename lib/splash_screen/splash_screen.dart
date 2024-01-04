import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget.child!),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 153, 243, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.zero, // Padding set to zero
              child: Text(
                "Bus Go",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height:
                  0, // Adjusted height between "Bus Go" and "Navigate. Book. Go."
            ),
            const Text(
              "Navigate. Book. Go.",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 4, // Adjusted spacing between the text and image
            ),
            Transform.rotate(
              angle: 90 * 3.14159265359 / 180, // Rotate by 90 degrees clockwise
              child: Image.asset(
                'assets/arrow.png', // Replace with your arrow image path
                height: 40, // Set the height of the image as needed
                width: 100, // Set the width of the image as needed
                color: Colors.white, // Set the color of the image
              ),
            ),
          ],
        ),
      ),
    );
  }
}
