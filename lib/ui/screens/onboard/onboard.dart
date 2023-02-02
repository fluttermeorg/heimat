import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heimat/ui/screens/home/home.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:heimat/ui/utils/status_bar_style.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // device sizes
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: statusBarStyle(),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/onboard.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    width: width,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Home of\nBEAUTY\nand LOVE",
                      style: GoogleFonts.tinos(
                        textStyle: const TextStyle(
                          color: white,
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: width,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const HomeScreen(),
                                ),
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: primary,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                RippleAnimation(
                                  repeat: true,
                                  color: secondary,
                                  minRadius: 50,
                                  ripplesCount: 3,
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: primary,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: primary.withOpacity(0.25),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 42,
                                  color: secondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "Explore Now",
                          style: TextStyle(
                            color: white,
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
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
