import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../design_system.dart';

class RichRadioView extends StatefulWidget {
  var titles;
  var selectedIndex;
  var onItemSelected;

  RichRadioView(this.titles, this.onItemSelected, [this.selectedIndex = 0]);

  @override
  _RichRadioViewState createState() => _RichRadioViewState();
}

class _RichRadioViewState extends State<RichRadioView> {
  var unselectedTextColor = mono600;

  var unselectedBgColor = mono300;

  var selectedTextColor = mono100;

  var selectedBgColor = mono600;

  double fontSize = 14;

  final double buttonSpace = 8;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = widget.titles
        .map<Widget>((e) => _button(e, widget.titles.indexOf(e)))
        .toList();

    return Row(children: buttons);
  }

  Widget _button(String title, int index) {
    bool isSelected = widget.titles.indexOf(title) == widget.selectedIndex;
    if (isSelected) {
      return Padding(
        padding: EdgeInsets.only(right: buttonSpace),
        child: TextButton(
          child: Text(
            title,
            style: TextStyle(
              color: selectedTextColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.black54,
            primary: Colors.black54,
            minimumSize: Size(64, 36),
            padding: EdgeInsets.all(1),
            backgroundColor: selectedBgColor,
          ),
          onPressed: () {
            setState(() {
              widget.selectedIndex = index;
              widget.onItemSelected(index);
            });
          },
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(right: buttonSpace),
        child: TextButton(
          child: Text(
            title,
            style: TextStyle(
              color: unselectedTextColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.black54,
            primary: Colors.black54,
            minimumSize: Size(64, 36),
            padding: EdgeInsets.all(1),
            backgroundColor: unselectedBgColor,
          ),
          onPressed: () {
            setState(() {
              widget.selectedIndex = index;
              widget.onItemSelected(index);
            });
          },
        ),
      );
    }
  }
}
