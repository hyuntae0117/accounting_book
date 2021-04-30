import 'dart:ui';

import 'package:accounting_book/view/module/daily_expenditure_view.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../design_system.dart';

class AccountingPage extends StatefulWidget {
  @override
  _AccountingPageState createState() => _AccountingPageState();
}

class _AccountingPageState extends State<AccountingPage>
    with SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const unselectedColor = mono400;
    const selectedColor = mono700;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(30, 100),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TabBar(
                indicatorColor: mono700,
                indicatorPadding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                isScrollable: true,
                labelColor: selectedColor,
                unselectedLabelColor: unselectedColor,
                tabs: [
                  new Tab(
                    child: Text(
                      '월별',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Tab(
                    child: Text(
                      '연별',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Tab(
                    child: Text(
                      '전체',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                controller: tabController,
                labelPadding: EdgeInsets.fromLTRB(8, 0, 8, 0)),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              padding: EdgeInsets.all(16),
              decoration: new BoxDecoration(
                color: mono700,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 20,
                          child: IconButton(
                            padding: EdgeInsets.only(right: 8),
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Text(
                          "2021.03",
                          style: TextStyle(
                            fontSize: 16,
                            color: mono100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                          height: 20,
                          child: IconButton(
                            padding: EdgeInsets.only(left: 8),
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "사용금액",
                        style: TextStyle(
                            fontSize: 12,
                            color: mono400,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "1,000,000원",
                        style: TextStyle(
                          fontSize: 24,
                          color: mono100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(
                        'assets/images/arrow_down.svg',
                        semanticsLabel: 'btn-indicator',
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 24, 8),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "전체 내역",
                              style: TextStyle(
                                color: mono700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "접기",
                      style: TextStyle(
                        fontSize: 14,
                        color: mono700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            //   child: DailyExpenditureView(),
            // ),
            // ExpandableTheme(
            //   data: const ExpandableThemeData(
            //     iconColor: Colors.blue,
            //     useInkWell: true,
            //   ),
            //   child: ListView(
            //     physics: const BouncingScrollPhysics(),
            //     children: <Widget>[
            //       Text("hihi"),
            //       Text("hihi"),
            //       Text("hihi"),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
