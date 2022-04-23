import 'package:accounting_book/design_system.dart';
import 'package:accounting_book/model/spend_type.dart';
import 'package:accounting_book/utils/DateTimeUtils.dart';
import 'package:accounting_book/view/module/category_view.dart';
import 'package:accounting_book/view/module/rich_radio_view.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class ExpenditureRegisterPage extends StatefulWidget {
  @override
  _ExpenditureRegisterPageState createState() =>
      _ExpenditureRegisterPageState();
}

class _ExpenditureRegisterPageState extends State<ExpenditureRegisterPage> {
  DateTime selectedDate = DateTime.now();

  final double paddingLeft = 24;

  var selectedSpendType = SpendType.consumption;

  var fixedExpenditure = false;

  Widget _registerRow(String title, Widget widget) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return _getCategoryView(context);
            });
      },
      child: Container(
        color: mono100,
        height: 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: paddingLeft),
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
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
      RichRadioView(
        category.map((e) => e.title).toList(),
        (index) {
          setState(() {
            print(index);
            selectedSpendType = category[index];
          });
        },
        category.indexOf(
          selectedSpendType,
        ),
      ),
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
    return Column(
      children: [
        _registerRow(
          '고정' + selectedSpendType.title,
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
        ),
        if (fixedExpenditure) _fixedExpenditureSubview()
      ],
    );
  }

  Widget _fixedExpenditureSubview() {
    return Container(
      color: mono200,
      child: Column(
        children: [
          _registerRow(
              '주기',
              Text(
                '매 월 6일마다',
                style: TextStyle(
                  color: mono700,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )),
          _registerRow(
              '기간',
              Text(
                '매 월 6일마다',
                style: TextStyle(
                  color: mono700,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )),
        ],
      ),
    );
  }

  Widget _memoRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: paddingLeft),
          SizedBox(
            width: 56,
            child: Text(
              '메모',
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
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              cursorColor: mono700,
              style: TextStyle(
                color: mono700,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: "메모 입력",
                hintStyle: TextStyle(color: mono400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mono100,
        bottomSheet: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => mono700),
              ),
              onPressed: () {},
              child: Text(
                '저장',
                style: TextStyle(
                  fontSize: 16,
                  color: mono100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 56,
                child: Row(
                  children: [
                    SizedBox(width: paddingLeft),
                    Text(
                      '가계부 입력',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: mono700,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    IconButton(
                      icon: Icon(Icons.close_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _dateInputRow(),
                    _amountInputRow(),
                    _spendTypeRadioRow(),
                    _categoryInputRow(),
                    _paymentMethodInputRow(),
                    _fixedExpenditureRadioRow(),
                    _memoRow(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCategoryView(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter monthStateSet) {
      return CategoryView();
    });
    // return StatefulBuilder(
    //   builder: (BuildContext context, StateSetter monthStateSet) {
    //     return Container(
    //         height: 400,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(20),
    //             topRight: Radius.circular(20),
    //           ),
    //         ),
    //         child: ListView(
    //           children: [
    //             TextField(
    //               keyboardType: TextInputType.multiline,
    //               maxLines: 4,
    //               cursorColor: mono700,
    //               style: TextStyle(
    //                 color: mono700,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 14,
    //               ),
    //               decoration: InputDecoration(
    //                 contentPadding: EdgeInsets.zero,
    //                 border: InputBorder.none,
    //                 hintText: "메모 입력",
    //                 hintStyle: TextStyle(color: mono400),
    //               ),
    //             ),
    //             TextField(
    //               keyboardType: TextInputType.multiline,
    //               maxLines: 4,
    //               cursorColor: mono700,
    //               style: TextStyle(
    //                 color: mono700,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 14,
    //               ),
    //               decoration: InputDecoration(
    //                 contentPadding: EdgeInsets.zero,
    //                 border: InputBorder.none,
    //                 hintText: "메모 입력",
    //                 hintStyle: TextStyle(color: mono400),
    //               ),
    //             ),
    //             TextField(
    //               keyboardType: TextInputType.multiline,
    //               maxLines: 4,
    //               cursorColor: mono700,
    //               style: TextStyle(
    //                 color: mono700,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 14,
    //               ),
    //               decoration: InputDecoration(
    //                 contentPadding: EdgeInsets.zero,
    //                 border: InputBorder.none,
    //                 hintText: "메모 입력",
    //                 hintStyle: TextStyle(color: mono400),
    //               ),
    //             ),
    //           ],
    //         ));
    //   },
    // );
  }

  Widget _getCalendarView(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter monthStateSet) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: TableCalendar(
            headerStyle: HeaderStyle(
              headerMargin: EdgeInsets.only(bottom: 8),
              titleCentered: true,
              titleTextFormatter: (date, dm) {
                return DateTimeUtils.getCalendarTitle(date);
              },
              formatButtonVisible: false,
            ),
            calendarFormat: CalendarFormat.month,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: selectedDate,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              this.selectedDate = selectedDay;
              monthStateSet(() {});
              setState(() {});
              print(selectedDay);
            },
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, DateTime focusedDay) {
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: chart100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                return Center(
                  child: ClipOval(
                    child: Container(
                      width: 38,
                      height: 38,
                      color: mono700,
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: TextStyle(
                            color: mono100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
