import 'package:flutter/material.dart';
import 'package:flutter_application_12/constants/app_colors.dart';
import 'package:flutter_application_12/model/digimon_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DigimonCard extends StatelessWidget {
  final DigimonModel digimon;
  final Color shadowColor;
  final VoidCallback onTap;
  const DigimonCard({
    super.key,
    required this.digimon,
    this.shadowColor = AppColors.yellowGlow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
       
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),

        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(24.0),

      

          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.9),
              spreadRadius: 8,
              blurRadius: 25,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              digimon.name.toUpperCase(),
              // style: const TextStyle(
              //   fontSize: 22.0,
              //   fontWeight: FontWeight.bold,
              //   color: Colors.black,
              //   fontFamily: 'BubblegumSans',
              // ),
              style: GoogleFonts.bubblegumSans(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,

              ),
            ),
            const SizedBox(height: 15.0),

            SizedBox(
              height: 150,
              child: Image.network(
                digimon.img,
                fit: BoxFit.contain,

                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 15.0),

            Text(
              digimon.level,
              // style: const TextStyle(
              //   fontSize: 16.0,
              //   fontWeight: FontWeight.w500,
              //   color: Colors.black54,
              // ),
              style: GoogleFonts.bubblegumSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
