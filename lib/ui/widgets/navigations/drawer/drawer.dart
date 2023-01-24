import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:heimat/ui/widgets/navigations/drawer/drawer_route.dart';

class CusDrawer extends StatefulWidget {
  const CusDrawer({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  State<CusDrawer> createState() => _CusDrawerState();
}

class _CusDrawerState extends State<CusDrawer> {
  @override
  Widget build(BuildContext context) {
    // parent size (device size)
    double width = widget.width;
    double height = widget.height;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: primary.withOpacity(0.80),
      ),
      child: Drawer(
        width: (width / 100) * 25,
        elevation: 0,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Column(
              children: [
                SizedBox(
                  height: (height / 100) * 15,
                  child: DrawerHeader(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.zero,
                    child: Image.asset(
                      "images/logo_2_trans.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      children: drawerRoute(height: height),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
