import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.bottomImage = "assets/images/background_login.webp",
  }) : super(key: key);

  final String bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                bottomImage,
                color: Colors.white.withOpacity(0.25),
                colorBlendMode: BlendMode.modulate,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
