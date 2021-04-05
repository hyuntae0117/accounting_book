import 'package:accounting_book/view/module/expenditure_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../design_system.dart';

class ETCPage extends StatefulWidget {
  @override
  _ETCPageState createState() => _ETCPageState();
}

class _ETCPageState extends State<ETCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpansionPanelList(
        children: [
          ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Text("hi");
              },
              body: Text("hi"))
        ],
      ),
    );

    return ExpansionTile(
      childrenPadding: EdgeInsets.zero,
      trailing: null,
      tilePadding: EdgeInsets.zero,
      title: Transform.translate(
        offset: Offset(0, 0),
        child: Container(
          color: red400,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '2021.02.15 (화)',
              style: TextStyle(
                  fontSize: 14, color: mono500, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      children: [
        ExpenditureDetailView(),
        ExpenditureDetailView(),
        ExpenditureDetailView(),
        ExpenditureDetailView(),
      ],
    );
  }
}
