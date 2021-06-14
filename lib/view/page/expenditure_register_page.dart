import 'package:accounting_book/design_system.dart';
import 'package:accounting_book/model/spend_type.dart';
import 'package:accounting_book/utils/DateTimeUtils.dart';
import 'package:accounting_book/view/module/rich_radio_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenditureRegisterPage extends StatefulWidget {
  @override
  _ExpenditureRegisterPageState createState() =>
      _ExpenditureRegisterPageState();
}

class _ExpenditureRegisterPageState extends State<ExpenditureRegisterPage> {
  DateTime selectedDate = DateTime.now();

  var selectedSpendType = SpendType.consumption;

  var fixedExpenditure = false;

  Widget _registerRow(String title, Widget widget) {
    return SizedBox(
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 56,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: mono500,
              ),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          widget,
        ],
      ),
    );
  }

  Widget _dateInputRow() {
    return _registerRow(
      '날짜',
      Text(
        DateTimeUtils.getDateStr(selectedDate),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: mono700,
        ),
      ),
    );
  }

  Widget _amountInputRow() {
    return _registerRow(
      '금액',
      Expanded(
        child: TextField(
          cursorColor: mono700,
          style: TextStyle(
            color: mono700,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "금액을 입력해주세요",
            hintStyle: TextStyle(color: mono400),
          ),
        ),
      ),
    );
  }

  Widget _spendTypeRadioRow() {
    var category = [
      SpendType.consumption,
      SpendType.income,
      SpendType.investent
    ];
    return _registerRow(
      '분류',
      RichRadioView(category.map((e) => e.title).toList(), () {}),
    );
  }

  Widget _categoryInputRow() {
    return _registerRow(
      '카테고리',
      Text(
        '문화생활',
        style: TextStyle(
          color: mono700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _paymentMethodInputRow() {
    return _registerRow(
      '결제수단',
      Text(
        '카드(사용자입력)',
        style: TextStyle(
          color: mono700,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _fixedExpenditureRadioRow() {
    return _registerRow(
      '고정지출',
      CupertinoSwitch(
        value: fixedExpenditure,
        trackColor: mono300,
        activeColor: mono600,
        onChanged: (value) {
          setState(() {
            fixedExpenditure = value;
          });
        },
      ),
    );
  }

  Widget _memoRow() {
    return _registerRow(
      '메모',
      Expanded(
        child: TextField(
          cursorColor: mono700,
          style: TextStyle(
            color: mono700,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "메모 입력",
            hintStyle: TextStyle(color: mono400),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '가계부 입력',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: mono700,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            _dateInputRow(),
            _amountInputRow(),
            _spendTypeRadioRow(),
            _categoryInputRow(),
            _paymentMethodInputRow(),
            _fixedExpenditureRadioRow(),
            _memoRow(),
          ],
        ),
      ),
    );
  }
}

class DateFormat {}
