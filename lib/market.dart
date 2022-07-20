import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Market extends StatelessWidget {
  final String mType;
  final bool isSelected;
  final VoidCallback onTap;

  const Market(
      {super.key,
      required this.mType,
      required this.isSelected,
      required this.onTap});

// ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          mType,
          style: GoogleFonts.bebasNeue(
            letterSpacing: 2,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
