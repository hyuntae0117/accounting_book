import 'package:flutter/material.dart';
import '../../design_system.dart';

class ExpenditureDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '캐시백',
                style: TextStyle(
                  fontSize: 14,
                  color: mono700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '현금',
                    style: TextStyle(
                      fontSize: 12,
                      color: mono400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '카테고리',
                    style: TextStyle(
                      fontSize: 12,
                      color: mono400,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
          Text(
            '+800,000원',
            style: TextStyle(
              fontSize: 16,
              color: red400,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
