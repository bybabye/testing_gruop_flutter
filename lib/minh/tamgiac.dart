import 'package:app_test/components/circle_button.dart';
import 'package:app_test/components/text_field_input.dart';
import 'package:app_test/theme/app_style.dart';
import 'package:flutter/material.dart';

class Tamgiac extends StatefulWidget {
  const Tamgiac({super.key});

  @override
  State<Tamgiac> createState() => _TamgiacState();
}

class _TamgiacState extends State<Tamgiac> {
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

  String ketqua(double a, double b, double c) {
    String result = '';
    if (a < b + c && b < a + c && c < a + b) {
      if (a * a == b * b + c * c ||
          b * b == a * a + c * c ||
          c * c == b * b + a * a) {
        result =
            'Đây là tam giác vuông'; //  pow(a,2) = pow(b,2) + pow(c,2) -> pytago
      } else if (a == b && b == c) {
        result = 'Đây là tam giác đều';
      } else if (a == b || a == c || b == c) {
        result = 'Đây là tam giác cân';
      } else if (a * a > b * b + c * c ||
          b * b > a * a + c * c ||
          c * c > a * a + b * b) {
        result = 'Đây là tam giác tù';
      } else {
        result = 'Đây là tam giác nhọn';
      }
    } else {
      result = 'a,b,c không phải là tam giác';
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
          'Kiểm tra tam giác',
          style: AppStyles.h3,
        ),
        const Text(
          'lưu ý : nhập cạnh a,b,c > 0 ',
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
                    overflow: TextOverflow.ellipsis,
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
                result = ketqua(double.parse(a.text), double.parse(b.text),
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
