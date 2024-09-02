import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTaskBox extends StatelessWidget {
  CategoryTaskBox(
      {super.key,
      required this.name,
      required this.onSelected,
      this.gradient,
      this.color,
      this.textColor});

  final String name;
  final Function() onSelected;
  LinearGradient? gradient;
  Color? color;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        height: 50,
        width: 111.43,
        decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(40.57)),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.philosopher(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
