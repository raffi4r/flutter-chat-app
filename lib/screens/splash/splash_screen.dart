import 'dart:async';

import 'package:coba_flutter/screens/login/login_screen.dart';
import 'package:coba_flutter/screens/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isViewed = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getBool('onBoard')!;
  runApp(const MyApp());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/splash.webp"),
                          fit: BoxFit
                              .fitHeight))) // This trailing comma makes auto-formatting nicer for build methods.
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                isViewed ? const LoginScreen() : const OnBoardingScreen()));
  }
}
