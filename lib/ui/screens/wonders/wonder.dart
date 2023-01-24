import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';

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
    double width = widget.width;
    double height = widget.height;

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
                    padding: EdgeInsets.only(bottom: (height / 100) * 5),
                    decoration: BoxDecoration(
                      color: primary,
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          primary,
                          primary.withOpacity(.80),
                          primary.withOpacity(.70),
                          primary.withOpacity(.50),
                          primary.withOpacity(.00),
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
            Positioned(
              top: (height / 100) * 10,
              right: (width / 100) * 10,
              width: 80,
              height: 80,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: white, width: 2),
                    image: const DecorationImage(
                      image: AssetImage("images/victoria_falls3.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (height / 100) * 25,
              left: (width / 100) * 20,
              width: 80,
              height: 80,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: white, width: 2),
                    image: const DecorationImage(
                      image: AssetImage("images/victoria_falls6.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (height / 100) * 45,
              right: (width / 100) * 30,
              width: 80,
              height: 80,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: white, width: 2),
                    image: const DecorationImage(
                      image: AssetImage("images/victoria_falls10.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (height / 100) * 60,
              left: (width / 100) * 13,
              width: 80,
              height: 80,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: white, width: 2),
                    image: const DecorationImage(
                      image: AssetImage("images/victoria_falls4.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(height: height, color: primary),
      ],
    );
  }
}
