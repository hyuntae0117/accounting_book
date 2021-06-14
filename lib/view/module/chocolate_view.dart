import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../design_system.dart';

class ChocolateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
        decoration: BoxDecoration(
          color: mono700,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: <Widget>[
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
                padding: const EdgeInsets.only(right: 24),
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
            ExpandablePanel(
              theme: const ExpandableThemeData(
                iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                // iconPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                iconSize: 24,
                iconColor: Colors.white,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Row(
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
                ],
              ),
              expanded: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(16, 14, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "+1,200,000원",
                      style: TextStyle(color: mono100),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "-100,000원",
                      style: TextStyle(color: mono100),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "400,000원",
                      style: TextStyle(color: mono100),
                    ),
                  ],
                ),
              ),
              collapsed: null,
            ),
          ],
        ),
      ),
    );
  }
}
