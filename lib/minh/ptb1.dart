import 'package:app_test/components/circle_button.dart';
import 'package:app_test/components/text_field_input.dart';
import 'package:app_test/theme/app_style.dart';
import 'package:flutter/material.dart';

class Ptb1 extends StatefulWidget {
  const Ptb1({super.key});

  @override
  State<Ptb1> createState() => _Ptb1State();
}

class _Ptb1State extends State<Ptb1> {
  String result = '';
  bool isHover = false;
  late TextEditingController a;
  late TextEditingController b;

  @override
  void initState() {
    super.initState();

    a = TextEditingController();
    b = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    a.dispose();
    b.dispose();
  }

  String ketqua(double a, double b) {
    String result;

    if (a == 0) {
      result = b == 0 ? 'phương trình vô số nghiệm' : 'phương trình vô nghiệm';
    } else {
      double nghiem = -b / a;
      result = nghiem.toString();
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Giải phương trình bậc 1',
          style: AppStyles.h3,
        ),
        const Text(
          'Phương trình có dạng : ax + b = 0',
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
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        CircleButton(
          func: () {
            if (a.text.isEmpty ||
                b.text.isEmpty ||
                double.parse(a.text).isInfinite ||
                double.parse(b.text).isInfinite) {
              result = 'input invalid';
            } else {
              try {
                result = ketqua(double.parse(a.text), double.parse(b.text));
              } catch (e) {
                result = 'Error';
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
