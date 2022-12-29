import 'dart:math';

import 'package:app_test/components/circle_button.dart';
import 'package:app_test/components/text_field_input.dart';
import 'package:app_test/theme/app_style.dart';
import 'package:flutter/material.dart';

class Ptb2 extends StatefulWidget {
  const Ptb2({super.key});

  @override
  State<Ptb2> createState() => _Ptb2State();
}

class _Ptb2State extends State<Ptb2> {
  String result = '';
  late TextEditingController a;
  late TextEditingController b;
  late TextEditingController c;
  bool isHover = false;

  @override
  void initState() {
    super.initState();

    a = TextEditingController();
    b = TextEditingController();
    c = TextEditingController();
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  String ptb2(double a, double b, double c) {
    String result = '';

    // ax^2 + bx + c = 0

    // a = 0 => bx + c = 0;
    if (a == 0) {
      if (b == 0) {
        result =
            c == 0 ? 'phương trình vô số nghiệm' : 'phương trình vô nghiệm';
      } else {
        double nghiem = -c / b;
        result = 'x = $nghiem';
      }
    } else {
      // a # 0
      double delta = (b * b) - (4 * a * c);
      if (delta < 0) {
        result = 'phương trình vô nghiệm';
      } else if (delta == 0) {
        double x = -b / (2 * a);
        result = 'phương trình có nghiệm kép x1 = x2 = $x';
      } else {
        double sqrtDelta = sqrt(delta);
        double x1 = (-b + sqrtDelta) / (2 * a);
        double x2 = (-b - sqrtDelta) / (2 * a);

        result = 'phương trình có nghiệm x1= ${format(x1)} , x2= ${format(x2)}';
      }
    }
    return result;
  }

  @override
  void dispose() {
    super.dispose();
    a.dispose();
    b.dispose();
    c.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Giải Phương trình bậc 2',
          style: AppStyles.h3,
        ),
        const Text(
          'Phương trình bậc 2 có dạng : ax^2 + bx + c = 0',
          style: AppStyles.h5,
        ),
        TextFieldInput(
          controller: a,
          hintText: 'Nhập a :',
        ),
        TextFieldInput(
          controller: b,
          hintText: 'Nhập b :',
        ),
        TextFieldInput(
          controller: c,
          hintText: 'Nhập c :',
        ),
        if (result.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                const Text(
                  'Kết quả : ',
                  style: AppStyles.h4,
                ),
                Expanded(
                  child: Text(
                    result,
                    style: AppStyles.h4,
                  ),
                )
              ],
            ),
          ),
        CircleButton(
          func: () {
            if (a.text.isEmpty || b.text.isEmpty || c.text.isEmpty) {
              result = 'Input Invalid';
            } else {
              try {
                result = ptb2(double.parse(a.text), double.parse(b.text),
                    double.parse(c.text));
              } catch (e) {
                result = 'Input Invalid';
              }
            }
            setState(() {});
          },
          hover: isHover,
          isHover: (value) {
            setState(() {
              isHover = value;
            });
          },
        ),
      ],
    );
  }
}
