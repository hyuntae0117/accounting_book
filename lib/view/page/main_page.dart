import 'package:accounting_book/view/module/fab_bottom_app_bar_item.dart';
import 'package:accounting_book/view/page/accounting_page.dart';
import 'package:accounting_book/view/page/etc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController _pageController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pageView = PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        AccountingPage(),
        ETCPage(),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.lightGreen,
        ),
      ],
    );

    return DefaultTabController(
        length: tabController.length,
        child: Scaffold(
          body: SafeArea(child: pageView),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            elevation: 2.0,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: FABBottomAppBar(
            notchedShape: CircularNotchedRectangle(),
            onTabSelected: (index) {
              _pageController.jumpToPage(index);
            },
            items: [
              FABBottomAppBarItem(iconData: Icons.home, text: '가계부'),
              FABBottomAppBarItem(iconData: Icons.search, text: '자산현황'),
              FABBottomAppBarItem(iconData: Icons.account_circle, text: '??'),
              FABBottomAppBarItem(iconData: Icons.more_horiz, text: '설정'),
            ],
          ),
        ));
  }
}
