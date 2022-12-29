import 'package:app_test/theme/app_style.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.024, vertical: height * 0.024),
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.024, vertical: height * 0.024),
      decoration: BoxDecoration(
          color: const Color(0xFFE7EBEF),
          borderRadius: BorderRadius.circular(16),
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
              color: const Color(0xFFFFFFFF).withOpacity(.9),
              offset: const Offset(
                -10.0,
                -10.0,
              ),
              blurRadius: 30.0,
            ), //B
          ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: AppStyles.h5,
        ),
      ),
    );
  }
}
