import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('images/Rectangle 1.png'),
          Text(
            'Welcome',
            style: GoogleFonts.philosopher(fontSize: 21),
          )
        ],
      ),
    );
  }
}
