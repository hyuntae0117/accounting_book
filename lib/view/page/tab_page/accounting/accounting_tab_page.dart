import 'dart:ui';
import 'dart:math';
import 'package:accounting_book/model/spend_type.dart';
import 'package:accounting_book/view/module/chocolate_view.dart';
import 'package:accounting_book/view/module/daily_expenditure_view.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../design_system.dart';

class AccountingPage extends StatefulWidget {
  @override
  _AccountingPageState createState() => _AccountingPageState();
}

class _AccountingPageState extends State<AccountingPage>
    with SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  TabController tabController;

  SpendType selectedSpendType = SpendType.all;

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

  Widget _spendTypeSelectView() {
    return DropdownButton(
      value: selectedSpendType,
      underline: SizedBox(),
      iconSize: 8,
      icon: Padding(
        padding: EdgeInsets.all(2),
        child: Transform.rotate(
          angle: 90 * pi / 180,
          child: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
      items: SpendType.values
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e.title,
                style: TextStyle(
                    color: mono700, fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedSpendType = value;
        });
      },
    );
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Column(
            children: [
              ChocolateView(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _spendTypeSelectView(),
                  TextButton(
                    onPressed: () {},
                    child: Text("접기"),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    DailyExpenditureView(),
                    DailyExpenditureView(),
                    DailyExpenditureView(),
                    DailyExpenditureView(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
