import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:heimat/ui/widgets/navigations/hero.dart';

class InfoCardDetail extends StatefulWidget {
  const InfoCardDetail({
    super.key,
    required this.width,
    required this.height,
    required this.photo,
  });

  final double width;
  final double height;
  final String photo;

  @override
  State<InfoCardDetail> createState() => _InfoCardDetailState();
}

class _InfoCardDetailState extends State<InfoCardDetail> {
  double scrollPos = 0.0;
  late ScrollController scrollCtr;

  @override
  void initState() {
    super.initState();
    listenToScroll();
  }

  void listenToScroll() {
    scrollCtr = ScrollController();
    scrollCtr.addListener(() {
      setState(() => scrollPos = scrollCtr.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    // parent size (device size)
    double width = widget.width, height = widget.height;

    // getting data
    String photo = widget.photo;

    return Scaffold(
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollCtr,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                elevation: 0,
                expandedHeight: height * 0.6,
                automaticallyImplyLeading: false,
                backgroundColor: transparent,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    // get top of constraints (height)
                    double top = constraints.biggest.height;

                    return FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      titlePadding: EdgeInsets.zero,
                      title: Container(
                        width: width,
                        height: height * 0.30,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              top > 200 ? black.withOpacity(.5) : transparent,
                              top > 200 ? black.withOpacity(.3) : transparent,
                              top > 200 ? black.withOpacity(.0) : transparent,
                            ],
                          ),
                        ),
                        child: SizedBox(
                          width: width * 0.80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (top > 200)
                                Flexible(
                                  child: Text(
                                    "Zimbabwe",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: white.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              if (top > 200) const SizedBox(height: 15),
                              Flexible(
                                child: Text(
                                  "Victoria Falls",
                                  style: TextStyle(
                                    fontSize: top < 200 ? 24 : 52,
                                    fontWeight: FontWeight.w400,
                                    color: top <= 100 ? primary : white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      background: PhotoHero(
                        photo: photo,
                        width: width,
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.05,
                    horizontal: width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.80,
                        child: const Text(
                          "Aenean sollicitudin, quam in convallis egestas.",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Donec sollicitudin sodales suscipit. Nam ornare dignissim enim sit amet imperdiet. Maecenas odio augue, tempus ac consequat ut, ullamcorper vel dolor. Aliquam justo urna, rutrum consequat pellentesque id, commodo quis tortor. Donec ac rhoncus dolor.",
                      ),
                      const SizedBox(height: 20),
                      const Text("data"),
                      const SizedBox(height: 200),
                      const Text("data"),
                      const SizedBox(height: 200),
                      const Text("data"),
                      const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (scrollPos < 300)
            Positioned(
              top: height * 0.30,
              right: 10,
              width: width * 0.20,
              height: height * 0.40,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() => photo = "images/victoria_falls.png");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("images/victoria_falls.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() => photo = "images/victoria_falls2.png");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("images/victoria_falls2.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() => photo = "images/victoria_falls3.png");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("images/victoria_falls3.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (scrollPos > 300)
            Positioned(
              bottom: height * 0.05,
              left: 10,
              right: 10,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          splashColor: transparent,
                          highlightColor: transparent,
                          onPressed: () {
                            scrollCtr.jumpTo(height);
                          },
                          icon: const Icon(
                            Icons.timeline_sharp,
                            color: primary,
                          ),
                        ),
                        IconButton(
                          splashColor: transparent,
                          highlightColor: transparent,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_frames_rounded,
                            color: primary,
                          ),
                        ),
                        IconButton(
                          splashColor: transparent,
                          highlightColor: transparent,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.link_rounded,
                            color: primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
