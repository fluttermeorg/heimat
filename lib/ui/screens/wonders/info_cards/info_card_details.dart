import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:heimat/ui/widgets/navigations/hero/photo_hero.dart';
import 'package:heimat/ui/widgets/navigations/hero/photo_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

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
  int gRow1 = 0, gRow2 = 0, gRow3 = 0;
  double scrollPos = 0.0;
  int stepperIndex = 0;
  late ScrollController scrollCtr;

  @override
  void initState() {
    super.initState();
    listenToScroll();
    getGallerySize();
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
              appBar(width, height, photo),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(width, height),
                    const SizedBox(height: 20),
                    imageGallery(height),
                    const SizedBox(height: 20),
                    content(width),
                    const SizedBox(height: 20),
                    citation(width),
                  ],
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(bottom: height * 0.20))
            ],
          ),
          if (scrollPos < 300) galleryOverhead(width, height, photo)
        ],
      ),
    );
  }

  Widget appBar(width, height, photo) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      elevation: 0,
      expandedHeight: height * 0.6,
      automaticallyImplyLeading: false,
      backgroundColor: scrollPos > height ? white : transparent,
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
    );
  }

  Widget header(width, height) {
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.05,
        left: width * 0.05,
        right: width * 0.05,
      ),
      child: Column(
        children: const [
          Text(
            "Aenean sollicitudin, quam in convallis egestas.",
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 20),
          Text(
            "Donec sollicitudin sodales suscipit. Nam ornare dignissim enim sit amet imperdiet. Maecenas odio augue, tempus ac consequat ut, ullamcorper vel dolor. Aliquam justo urna, rutrum consequat pellentesque id, commodo quis tortor. Donec ac rhoncus dolor.",
          ),
        ],
      ),
    );
  }

  void getGallerySize() {
    List imgSizeRange = List.generate(10 - 5 + 1, (i) => i + 5);

    gRow1 = (imgSizeRange..shuffle()).first;
    gRow2 = (imgSizeRange..shuffle()).indexOf(4);
    gRow3 = (imgSizeRange..shuffle()).last;
  }

  Widget imageGallery(height) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: gRow1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PhotoViewer(
                          photo: "images/victoria_falls3.png",
                        ),
                      ),
                    );
                  },
                  child: const PhotoHero(
                    photo: "images/victoria_falls3.png",
                    width: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 10 - gRow1,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PhotoViewer(
                          photo: "images/victoria_falls5.png",
                        ),
                      ),
                    );
                  },
                  child: const PhotoHero(
                    photo: "images/victoria_falls5.png",
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: gRow2,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PhotoViewer(
                          photo: "images/victoria_falls6.png",
                        ),
                      ),
                    );
                  },
                  child: const PhotoHero(
                    photo: "images/victoria_falls6.png",
                    width: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 10 - gRow2,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PhotoViewer(
                          photo: "images/victoria_falls7.png",
                        ),
                      ),
                    );
                  },
                  child: const PhotoHero(
                    photo: "images/victoria_falls7.png",
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: gRow3,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PhotoViewer(
                          photo: "images/victoria_falls8.png",
                        ),
                      ),
                    );
                  },
                  child: const PhotoHero(
                    photo: "images/victoria_falls8.png",
                    width: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 10 - gRow3,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PhotoViewer(
                          photo: "images/victoria_falls9.png",
                        ),
                      ),
                    );
                  },
                  child: const PhotoHero(
                    photo: "images/victoria_falls9.png",
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget galleryOverhead(width, height, photo) {
    return Positioned(
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
    );
  }

  Widget content(width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: const Text(
        "Donec sollicitudin sodales suscipit. Nam ornare dignissim enim sit amet imperdiet. Maecenas odio augue, tempus ac consequat ut, ullamcorper vel dolor. Aliquam justo urna, rutrum consequat pellentesque id, commodo quis tortor. Donec ac rhoncus dolor. Donec sollicitudin sodales suscipit. Nam ornare dignissim enim sit amet imperdiet. Maecenas odio augue, tempus ac consequat ut, ullamcorper vel dolor. Aliquam justo urna, rutrum consequat pellentesque id, commodo quis tortor. Donec ac rhoncus dolor.",
      ),
    );
  }

  Widget citation(width) {
    final Uri url = Uri.parse('https://flutter.dev');

    return Stepper(
      physics: const BouncingScrollPhysics(),
      currentStep: stepperIndex,
      controlsBuilder: (context, _) => const SizedBox(),
      onStepTapped: (int index) => setState(() => stepperIndex = index),
      steps: [
        Step(
          isActive: stepperIndex == 0,
          title: const Text("Citation 1"),
          content: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () async {
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text("https://flutter.dev"),
            ),
          ),
        ),
        Step(
          isActive: stepperIndex == 1,
          title: const Text("Citation 2"),
          content: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () async {
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text("https://flutter.dev"),
            ),
          ),
        ),
      ],
    );
  }
}
