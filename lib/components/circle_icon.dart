import 'package:app_test/theme/app_style.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.text, required this.isCheck});
  final String text;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFE7EBEF),
        borderRadius: BorderRadius.circular(50),
        boxShadow: isCheck
            ? [
                BoxShadow(
                  color: const Color(0xFFEAE7DC),
                  offset: const Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 1.0,
                  inset: isCheck,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: const Color(0xFFFFFFFF).withOpacity(.6),
                  offset: const Offset(
                    -1.0,
                    -1.0,
                  ),
                  blurRadius: 3.0,
                  inset: isCheck,
                ),
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(.6),
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 3.0,
                  inset: isCheck,
                ),
                BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(.6),
                    offset: const Offset(
                      -5.0,
                      -5.0,
                    ),
                    blurRadius: 15.0,
                    inset: isCheck,
                    spreadRadius: 1),
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(.3),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 15.0,
                  inset: isCheck,
                  spreadRadius: 1,
                ),
              ]
            : [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(.2),
                  offset: const Offset(
                    10.0,
                    10.0,
                  ),
                  blurRadius: 20.0,
                ),
                BoxShadow(
                  color: const Color(0xFFFFFFFF).withOpacity(.8),
                  offset: const Offset(
                    -10.0,
                    -10.0,
                  ),
                  blurRadius: 20.0,
                ),
              ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.h4.copyWith(
              color:
                  isCheck ? const Color(0xFF76AAF8) : const Color(0xFF8890A7),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
