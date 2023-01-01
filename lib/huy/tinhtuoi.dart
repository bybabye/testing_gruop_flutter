import 'package:app_test/components/circle_button.dart';
import 'package:app_test/components/text_field_input.dart';
import 'package:app_test/theme/app_style.dart';
import 'package:flutter/material.dart';

class TinhTuoi extends StatefulWidget {
  const TinhTuoi({super.key});

  @override
  State<TinhTuoi> createState() => _TinhTuoiState();
}

class _TinhTuoiState extends State<TinhTuoi> {
  String result = '';
  late TextEditingController a;

  bool isHover = false;
  @override
  void initState() {
    super.initState();

    a = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    a.dispose();
  }

  String tinhTuoi(int year) {
    // year = 2000
    // khoi tao bien ket qua
    String result = '';
    if (year < 1900) {
      result = 'Năm bạn nhập không hợp lệ';
      return result;
    }
    // lay nam hien tai
    int yearNow = DateTime.now().year;
    if (yearNow < year) {
      result = 'Năm bạn nhập lớn hơn năm hiện tại';
    } else {
      result = (yearNow - year).toString();
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Tính Tuổi',
          style: AppStyles.h3,
        ),
        const Text(
          'lưu ý : Nhập year > 1900',
          style: AppStyles.h5,
        ),
        TextFieldInput(
          controller: a,
          hintText: 'Ex : 1900',
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
            try {
              result = tinhTuoi(int.parse(a.text));
            } catch (e) {
              result = 'input invalid';
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
