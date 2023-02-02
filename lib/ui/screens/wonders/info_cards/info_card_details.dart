import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:heimat/ui/widgets/navigations/hero/photo_hero.dart';
import 'package:heimat/ui/widgets/navigations/hero/photo_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCardDetail extends StatefulWidget {
  const InfoCardDetail({
    super.key,
    required this.index,
    required this.width,
    required this.height,
    required this.photo,
    required this.wonder,
  });

  final int index;
  final double width;
  final double height;
  final String photo;
  final Map wonder;

  @override
  State<InfoCardDetail> createState() => _InfoCardDetailState();
}

class _InfoCardDetailState extends State<InfoCardDetail> {
  int gRow1 = 0, gRow2 = 0, gRow3 = 0;
  double scrollPos = 0.0;
  int stepperIndex = 0;
  String y = "1";
  late int index = widget.index;
  late String photo = widget.photo;
  late Map wonder = widget.wonder;

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

    return Scaffold(
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollCtr,
            physics: const BouncingScrollPhysics(),
            slivers: [
              appBar(width, height),
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
              SliverPadding(padding: EdgeInsets.only(bottom: height * 0.10))
            ],
          ),
          if (scrollPos < 300) galleryOverhead(width, height)
        ],
      ),
    );
  }

  Widget appBar(width, height) {
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
                          wonder["country"],
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
                        wonder["infos"]["info$index"]["title"],
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
        children: [
          Text(
            wonder["infos"]["info$index"]["subtitle"],
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 20),
          Text(wonder["infos"]["info$index"]["paragraph"]),
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
                        builder: (context) => PhotoViewer(
                          photo: wonder["images"]["img9"],
                        ),
                      ),
                    );
                  },
                  child: PhotoHero(
                    photo: wonder["images"]["img9"],
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
                        builder: (context) => PhotoViewer(
                          photo: wonder["images"]["img10"],
                        ),
                      ),
                    );
                  },
                  child: PhotoHero(
                    photo: wonder["images"]["img10"],
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
                        builder: (context) => PhotoViewer(
                          photo: wonder["images"]["img11"],
                        ),
                      ),
                    );
                  },
                  child: PhotoHero(
                    photo: wonder["images"]["img11"],
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
                        builder: (context) => PhotoViewer(
                          photo: wonder["images"]["img12"],
                        ),
                      ),
                    );
                  },
                  child: PhotoHero(
                    photo: wonder["images"]["img12"],
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
                        builder: (context) => PhotoViewer(
                          photo: wonder["images"]["img13"],
                        ),
                      ),
                    );
                  },
                  child: PhotoHero(
                    photo: wonder["images"]["img13"],
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
                        builder: (context) => PhotoViewer(
                          photo: wonder["images"]["img14"],
                        ),
                      ),
                    );
                  },
                  child: PhotoHero(
                    photo: wonder["images"]["img14"],
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

  Widget galleryOverhead(width, height) {
    List overheads = [6, 7, 8];
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
            for (var overhead in overheads)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: overheads.last == overhead ? 0 : 10,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() => photo = wonder["images"]["img$overhead"]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(wonder["images"]["img$overhead"]),
                          fit: BoxFit.cover,
                        ),
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
      child: Text(wonder["infos"]["info$index"]["content"]),
    );
  }

  Widget citation(width) {
    // citations from db
    List citations = wonder["citations"];

    return Stepper(
      physics: const BouncingScrollPhysics(),
      currentStep: stepperIndex,
      controlsBuilder: (context, _) => const SizedBox(),
      onStepTapped: (int index) => setState(() => stepperIndex = index),
      steps: [
        for (String cit in citations)
          Step(
            isActive: stepperIndex == citations.indexOf(cit),
            title: Text("Citation ${citations.indexOf(cit) + 1}"),
            content: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse(cit);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Text(cit),
              ),
            ),
          ),
      ],
    );
  }
}
