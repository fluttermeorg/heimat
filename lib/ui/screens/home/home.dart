import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heimat/ui/screens/wonders/wonder.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:heimat/ui/utils/status_bar_style.dart';
import 'package:heimat/ui/widgets/navigations/drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // device sizes
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBarStyle(),
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        drawerScrimColor: transparent,
        appBar: AppBar(
          backgroundColor: transparent,
          shadowColor: transparent,
          leading: IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: Image.asset("images/drawer.png"),
          ),
        ),
        drawer: CusDrawer(width: width, height: height),
        body: SingleChildScrollView(
          child: WonderScreen(width: width, height: height),
        ),
      ),
    );
  }
}
