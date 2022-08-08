import 'package:coba_flutter/component/background.dart';
import 'package:coba_flutter/constant.dart';
import 'package:coba_flutter/responsive.dart';
import 'package:coba_flutter/screens/login/component/login_form.dart';
import 'package:coba_flutter/screens/login/component/login_screen_top.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Background(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Responsive(
            mobile: const MobileLoginScreen(),
            desktop: Row(
              children: [
                const Expanded(
                  child: LoginScreenTop(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginForm(),
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

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTop(),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
