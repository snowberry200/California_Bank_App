import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatefulWidget {
  final ImageProvider image;
  final Widget child;
  const BackgroundImageWidget(
      {super.key, required this.image, required this.child});

  @override
  State<BackgroundImageWidget> createState() => _BackgroundImageWidgetState();
}

class _BackgroundImageWidgetState extends State<BackgroundImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: widget.image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.darken)),
      ),
      child: widget.child,
    );
  }
}


