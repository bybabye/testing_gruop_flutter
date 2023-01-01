import 'package:app_test/components/circle_icon.dart';
import 'package:app_test/huy/day_of_week_page.dart';
import 'package:app_test/huy/tinhtuoi.dart';

import 'package:app_test/minh/ptb1.dart';
import 'package:app_test/minh/tamgiac.dart';
import 'package:app_test/thao/ngay_tiep_theo.dart';
import 'package:app_test/thao/pttb2.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double height;
  late double width;
  int selectIndex = 0;
  List<Widget> pages = [
    const Ptb1(),
    const Tamgiac(),
    const NgayTiepTheo(),
    const Ptb2(),
    const TinhTuoi(),
    const DayOfWeekPage(),
  ];
  //8890A7

  //D9D9D9

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE7EBEF),
      body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      hoverColor: Colors.transparent,
                      child: CircleIcon(
                        text: 'Ptb1',
                        isCheck: selectIndex == 0,
                      ),
                      onTap: () {
                        setState(() {
                          selectIndex = 0;
                        });
                      },
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      child: CircleIcon(
                        text: 'Tam giac',
                        isCheck: selectIndex == 1,
                      ),
                      onTap: () {
                        setState(() {
                          selectIndex = 1;
                        });
                      },
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      child: CircleIcon(
                        text: 'Next Day',
                        isCheck: selectIndex == 2,
                      ),
                      onTap: () {
                        setState(() {
                          selectIndex = 2;
                        });
                      },
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      child: CircleIcon(
                        text: 'Ptb2',
                        isCheck: selectIndex == 3,
                      ),
                      onTap: () {
                        setState(() {
                          selectIndex = 3;
                        });
                      },
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      child: CircleIcon(
                        text: 'Tinh Tuoi',
                        isCheck: selectIndex == 4,
                      ),
                      onTap: () {
                        setState(() {
                          selectIndex = 4;
                        });
                      },
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      child: CircleIcon(
                        text: 'Day of Week',
                        isCheck: selectIndex == 5,
                      ),
                      onTap: () {
                        setState(() {
                          selectIndex = 5;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: height * 0.8,
                width: width * 0.26,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7EBEF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(.2),
                      offset: const Offset(
                        20.0,
                        20.0,
                      ),
                      blurRadius: 30.0,
                    ),
                    BoxShadow(
                      color: const Color(0xFFFFFFFF).withOpacity(.8),
                      offset: const Offset(
                        -20.0,
                        -20.0,
                      ),
                      blurRadius: 30.0,
                    ),
                  ],
                ),
                child: pages[selectIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
