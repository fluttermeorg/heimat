import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';

List<Widget> drawerRoute({required height}) {
  return [
    Center(
      child: RotatedBox(
        quarterTurns: -1,
        child: InkWell(
          onTap: () {},
          splashColor: transparent,
          highlightColor: transparent,
          child: const Text(
            "Pyramids of Giza",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
    SizedBox(height: height * 0.10),
    Center(
      child: RotatedBox(
        quarterTurns: -1,
        child: InkWell(
          onTap: () {},
          splashColor: transparent,
          highlightColor: transparent,
          child: const Text(
            "Victoria Falls",
            style: TextStyle(
              color: white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    ),
    SizedBox(height: height * 0.10),
    Center(
      child: RotatedBox(
        quarterTurns: -1,
        child: InkWell(
          onTap: () {},
          splashColor: transparent,
          highlightColor: transparent,
          child: const Text(
            "Mount Kilimanjaro",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
  ];
}
