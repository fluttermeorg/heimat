import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.width,
    required this.height,
    required this.bgImage,
    required this.onTap,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  final double width;
  final double height;
  final String bgImage;
  final GestureTapCallback onTap;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      width: 80,
      height: 80,
      child: Hero(
        tag: bgImage,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: primary,
                shape: BoxShape.circle,
                border: Border.all(color: white, width: 2),
                image: DecorationImage(
                  image: AssetImage(bgImage),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
