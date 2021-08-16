import 'package:cov_app_flutter/model/static/size.dart';
import 'package:flutter/material.dart';

class ComboBox extends StatelessWidget {
  const ComboBox(
      {Key key,
      @required double width,
      @required this.valueChoose,
      @required this.items,
      this.title,
      this.press})
      : _width = width,
        super(key: key);

  final double _width;
  final String valueChoose;
  final List items;
  final Function press;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5),
      width: _width * 0.8,
      decoration: BoxDecoration(
          color: Color(0XFFEFF3F6),
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(6, 2),
                blurRadius: 6.0,
                spreadRadius: 3.0),
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(-6, -2),
                blurRadius: 6.0,
                spreadRadius: 3.0)
          ]),
      child: Center(
        child: DropdownButton(
            hint: Text(title),
            underline: SizedBox(),
            value: valueChoose,
            onChanged: press,
            items: items.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(
                  valueItem,
                  style: TextStyle(fontSize: 12),
                ),
              );
            }).toList()),
      ),
    );
  }
}
