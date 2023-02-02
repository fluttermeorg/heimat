import 'package:flutter/material.dart';
import 'package:heimat/ui/screens/wonders/info_cards/info_card.dart';
import 'package:heimat/ui/screens/wonders/info_cards/info_card_details.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:heimat/ui/widgets/animations/shapes/line.dart';

class WonderScreen extends StatefulWidget {
  const WonderScreen({
    super.key,
    required this.width,
    required this.height,
    required this.wonder,
  });

  final double width;
  final double height;
  final Map wonder;

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

    Map wonder = widget.wonder;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(wonder["images"]["img1"]),
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
                        Text(
                          wonder["wonder"],
                          style: const TextStyle(
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
              bgImage: wonder["images"]["img2"],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoCardDetail(
                      index: 1,
                      width: width,
                      height: height,
                      photo: wonder["images"]["img2"],
                      wonder: wonder,
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
              bgImage: wonder["images"]["img3"],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoCardDetail(
                      index: 2,
                      width: width,
                      height: height,
                      photo: wonder["images"]["img3"],
                      wonder: wonder,
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
              bgImage: wonder["images"]["img4"],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoCardDetail(
                      index: 3,
                      width: width,
                      height: height,
                      photo: wonder["images"]["img4"],
                      wonder: wonder,
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
              bgImage: wonder["images"]["img5"],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoCardDetail(
                      index: 4,
                      width: width,
                      height: height,
                      photo: wonder["images"]["img5"],
                      wonder: wonder,
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
