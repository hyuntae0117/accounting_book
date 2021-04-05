import 'package:flutter/material.dart';
import '../../design_system.dart';
import 'expenditure_detail_view.dart';

class DailyExpenditureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.only(bottom: 4),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '2021.02.15 (화)',
              style: TextStyle(
                  fontSize: 14, color: mono500, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: 1,
          color: mono300,
        ),
        ExpenditureDetailView(),
        ExpenditureDetailView(),
        ExpenditureDetailView(),
        ExpenditureDetailView(),
      ],
    );
  }
}
