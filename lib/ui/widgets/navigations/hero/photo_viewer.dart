import 'package:flutter/material.dart';
import 'package:heimat/ui/utils/colors.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({super.key, required this.photo});

  final String photo;
  @override
  Widget build(BuildContext context) {
    // device sizes
    final width = MediaQuery.of(context).size.width;

    return Material(
      child: SizedBox(
        child: Stack(
          children: [
            PhotoView(
              initialScale: PhotoViewComputedScale.covered,
              imageProvider: AssetImage(photo),
            ),
            Positioned(
              bottom: width * 0.15,
              right: 20,
              child: InkWell(
                highlightColor: transparent,
                splashColor: transparent,
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.80),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
