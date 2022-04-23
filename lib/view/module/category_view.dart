import 'package:accounting_book/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  var ex = ['주거', '식비', '교통', '문화생활', '자기계발 및 취미'];

  double fontSize = 14;
  Color textColor = mono500;
  Color editableTextColor = mono700;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: red400,
      child: Column(
        children: [
          SizedBox(
            height: 68,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TITLE",
                    style: TextStyle(
                      color: mono700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(4),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "편집",
                      style: TextStyle(
                        fontSize: fontSize,
                        color: mono700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView(children: (ex.map((e) => _getList(e))).toList())),
        ],
      ),
    );
  }

  Widget _getList(String title) {
    return GestureDetector(
      onTap: () {
        print(title);
      },
      child: Container(
        color: Colors.amber,
        height: 56,
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize),
          ),
        ),
      ),
    );
  }

  Widget _getEditableList() {}
}
