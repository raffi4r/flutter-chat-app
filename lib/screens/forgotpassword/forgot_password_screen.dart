import 'package:coba_flutter/component/background.dart';
import 'package:coba_flutter/responsive.dart';
import 'package:coba_flutter/screens/forgotpassword/component/forgot_password_form.dart';
import 'package:coba_flutter/screens/forgotpassword/component/forgot_password_top.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Lupa Password",
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700,
                textStyle: const TextStyle(color: Colors.black)),
          ),
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ))),
      body: Background(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Responsive(
            mobile: const MobileForgotPasswordScreen(),
            desktop: Row(
              children: [
                const Expanded(
                  child: ForgotPasswordScreenTop(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: ForgotPasswordForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileForgotPasswordScreen extends StatelessWidget {
  const MobileForgotPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const ForgotPasswordScreenTop(),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: ForgotPasswordForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
