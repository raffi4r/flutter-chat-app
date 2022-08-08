import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenTop extends StatelessWidget {
  const LoginScreenTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: Image.asset(
                "assets/images/prioritas_logo.webp",
                width: 120,
                height: 120,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          "Prioritas Group",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          "Masuk ke akun PG Supporting",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
