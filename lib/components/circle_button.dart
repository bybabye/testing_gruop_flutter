import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.func,
      required this.hover,
      required this.isHover});
  final Function() func;
  final Function(bool value) isHover;
  final bool hover;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: isHover,
      onTap: func,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFE7EBEF),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(.2),
              offset: const Offset(
                10.0,
                10.0,
              ),
              blurRadius: 30.0,
            ), //BoxShado
            BoxShadow(
              color: const Color(0xFFFFFFFF).withOpacity(.8),
              offset: const Offset(
                -10.0,
                -10.0,
              ),
              blurRadius: 30.0,
            ),
          ],
        ),
        child: Icon(
          Icons.play_arrow_outlined,
          size: 40,
          color: hover ? const Color(0xFF76AAF8) : const Color(0xFF8890A7),
        ),
      ),
    );
  }
}
