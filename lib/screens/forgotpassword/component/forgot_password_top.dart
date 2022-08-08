import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreenTop extends StatelessWidget {
  const ForgotPasswordScreenTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 4,
                child: Image.asset(
                  "assets/images/input_email.webp",
                  width: 200,
                  height: 200,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            "Masukan email kamu yang terdaftar",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            "Kami akan kirimkan kode verifikasi ke alamat email kamu yang tedaftar.",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
