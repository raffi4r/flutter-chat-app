import 'package:coba_flutter/screens/login/login_screen.dart';
import 'package:coba_flutter/screens/onboarding/component/app_scroll_behavior.dart';
import 'package:coba_flutter/screens/onboarding/component/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SliderModel> mySLides = <SliderModel>[];
  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        height: isCurrentPage ? 10.0 : 10.0,
        width: isCurrentPage ? 10.0 : 10.0,
        decoration: BoxDecoration(
          color:
              isCurrentPage ? const Color(0XFFED220D) : const Color(0X4D000000),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = PageController();
  }

  isViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoard', true);
  }

  route() {
    isViewed();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  route();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Lewatkan",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFED220D)),
                      )),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Expanded(
            flex: 1,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                scrollBehavior: AppScrollBehavior(),
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideTile(
                    imagePath: mySLides[0].getImageAssetPath(),
                    title: mySLides[0].getTitle(),
                    desc: mySLides[0].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[1].getImageAssetPath(),
                    title: mySLides[1].getTitle(),
                    desc: mySLides[1].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[2].getImageAssetPath(),
                    title: mySLides[2].getTitle(),
                    desc: mySLides[2].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[3].getImageAssetPath(),
                    title: mySLides[3].getTitle(),
                    desc: mySLides[3].getDesc(),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: (slideIndex == 3) ? 40 : 0,
                width: (slideIndex == 3) ? 110 : 0,
                child: ElevatedButton(
                  onPressed: () {
                    route();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0XFFD50000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                  child: (slideIndex == 3)
                      ? Text("Lanjut",
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(color: Colors.white),
                              fontWeight: FontWeight.w700))
                      : const Text(""),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          i == slideIndex
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class SlideTile extends StatelessWidget {
  final String imagePath, title, desc;

  const SlideTile(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 56,
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 56,
          ),
          Text(
            title,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              desc,
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
