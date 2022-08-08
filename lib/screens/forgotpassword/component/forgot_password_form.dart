import 'package:coba_flutter/constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  bool isObscure = true;
  bool isValid = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7, bottom: 5),
            child: Text("Email",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0XFFCCCCCC))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0XFF999999))),
              hintText: "Masukan email kamu",
              prefixIcon: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person_rounded),
              ),
            ),
            onChanged: (value) {
              setState(() {
                isValid = EmailValidator.validate(value);
              });
            },
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "forgot_password_btn",
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isValid ? () {} : null,
                child: Text(
                  "Lanjut",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          // AlreadyHaveAnAccountCheck(
          //   press: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return SignUpScreen();
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
