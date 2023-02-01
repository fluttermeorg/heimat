import 'package:flutter/material.dart';
import 'package:heimat/ui/screens/wonders/info_cards/info_card.dart';
import 'package:heimat/ui/screens/wonders/info_cards/info_card_details.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:heimat/ui/widgets/animations/shapes/line.dart';

class WonderScreen extends StatefulWidget {
  const WonderScreen({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  State<WonderScreen> createState() => _WonderScreenState();
}

class _WonderScreenState extends State<WonderScreen>
    with TickerProviderStateMixin {
  late AnimationController upDownArrowCtr;
  late Animation<Offset> upDownArrowPos;

  @override
  void initState() {
    super.initState();
    downArrow();
  }

  @override
  void dispose() {
    super.dispose();
    upDownArrowCtr.dispose();
  }

  void downArrow() {
    // handling animation controller
    upDownArrowCtr = AnimationController(
      duration: const Duration(milliseconds: 2300),
      vsync: this,
    );

    // setting animation position
    upDownArrowPos = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ).animate(upDownArrowCtr);

    // calling animation infinity loop
    upDownArrowCtr.repeat();
  }

  @override
  Widget build(BuildContext context) {
    // parent size (device size)
    double width = widget.width, height = widget.height;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/victoria_falls2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: width,
                    height: height / 2,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: height * 0.05),
                    decoration: BoxDecoration(
                      color: primary,
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          primary,
                          primary.withOpacity(.8),
                          primary.withOpacity(.7),
                          primary.withOpacity(.5),
                          primary.withOpacity(.0),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Victoria Falls",
                          style: TextStyle(
                            color: secondary,
                            fontSize: 52,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 50),
                        SlideTransition(
                          position: upDownArrowPos,
                          child: const Icon(
                            Icons.keyboard_double_arrow_down_rounded,
                            color: secondary,
                            size: 32,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Lines Behind
            Positioned(
              top: (height * 0.10) + 40,
              left: (width * 0.20) + 40,
              child: CustomPaint(
                painter: LinePainter1(),
                child: SizedBox(width: width, height: height),
              ),
            ),
            Positioned(
              top: (height * 0.25) + 40,
              left: (width * 0.20) + 40,
              child: CustomPaint(
                painter: LinePainter2(),
                child: SizedBox(width: width, height: height),
              ),
            ),
            Positioned(
              top: (height * 0.45) + 40,
              left: (width * 0.50) + 40,
              child: CustomPaint(
                painter: LinePainter3(),
                child: SizedBox(width: width, height: height),
              ),
            ),

            // info cards
            InfoCard(
              height: height,
              width: width,
              top: height * 0.10,
              right: width * 0.10,
              bgImage: "images/victoria_falls3.png",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoCardDetail(
                      width: width,
                      height: height,
                      photo: "images/victoria_falls3.png",
                    ),
                  ),
                );
              },
            ),
            InfoCard(
              height: height,
              width: width,
              top: height * 0.25,
              left: width * 0.20,
              bgImage: "images/victoria_falls6.png",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoCardDetail(
                      width: width,
                      height: height,
                      photo: "images/victoria_falls6.png",
                    ),
                  ),
                );
              },
            ),
            InfoCard(
              height: height,
              width: width,
              top: height * 0.45,
              right: width * 0.30,
              bgImage: "images/victoria_falls10.png",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoCardDetail(
                      width: width,
                      height: height,
                      photo: "images/victoria_falls10.png",
                    ),
                  ),
                );
              },
            ),
            InfoCard(
              height: height,
              width: width,
              top: height * 0.60,
              left: width * 0.13,
              bgImage: "images/victoria_falls4.png",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoCardDetail(
                      width: width,
                      height: height,
                      photo: "images/victoria_falls4.png",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Container(height: height, color: primary),
      ],
    );
  }
}
