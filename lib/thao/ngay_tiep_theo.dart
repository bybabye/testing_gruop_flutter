import 'package:app_test/components/circle_button.dart';
import 'package:app_test/components/text_field_input.dart';
import 'package:app_test/thao/next_day.dart';
import 'package:app_test/theme/app_style.dart';
import 'package:flutter/material.dart';

class NgayTiepTheo extends StatefulWidget {
  const NgayTiepTheo({super.key});

  @override
  State<NgayTiepTheo> createState() => _NgayTiepTheoState();
}

class _NgayTiepTheoState extends State<NgayTiepTheo> {
  String result = '';
  late TextEditingController a;
  late NextDay _nextDay;
  bool isHover = false;
  @override
  void initState() {
    super.initState();

    a = TextEditingController();
    _nextDay = NextDay();
  }

  @override
  void dispose() {
    super.dispose();
    a.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Tính ngày tiếp theo',
          style: AppStyles.h3,
        ),
        const Text(
          'lưu ý : Nhập đúng theo như ví dụ : 12/09/2009',
          style: AppStyles.h5,
        ),
        TextFieldInput(
          controller: a,
          hintText: 'Ex : 29/10/2000',
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
            if (a.text.isEmpty) {
              result = 'input invalid';
            } else {
              try {
                List<String> date = a.text.split('/');
                if (date.length == 3) {
                  result = _nextDay.ngayKeTiep(int.parse(date[2]),
                      int.parse(date[0]), int.parse(date[1]));
                } else {
                  result = 'input invalid';
                }
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
