import 'dart:ui';

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
            ChocolateView(),
          ],
        ),
      ),
    );
  }
}
