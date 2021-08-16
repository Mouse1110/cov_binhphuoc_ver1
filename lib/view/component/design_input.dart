import 'package:cov_app_flutter/controller/provider/public.dart';
import 'package:cov_app_flutter/model/static/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleInput extends StatelessWidget {
  final String text;
  const TitleInput({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.2),
      color: Colors.blue.withOpacity(0.3),
      width: _width,
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.black, letterSpacing: 2, fontSize: 12),
      ),
    );
  }
}

class TitleReport extends StatelessWidget {
  final String text;
  final Color color;
  final Function press;
  const TitleReport({Key key, this.color, this.press, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 0.7),
          decoration: BoxDecoration(color: color),
          child: Center(
            child: Text(text,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
          ),
        ),
      ),
    );
  }
}

class ButtonRadio extends StatelessWidget {
  final bool check;
  final Function press;
  final String text;
  ButtonRadio({this.check, this.press, this.text});

  var items = ['Đạt', 'Không Đạt'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: kDefaultPadding * 0.5),
            decoration: BoxDecoration(
                color: Color(0XFFEFF3F6),
                borderRadius: BorderRadius.circular(12.0),
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
                  hint: Text('Không Đạt'),
                  value: check ? 'Đạt' : 'Không Đạt',
                  onChanged: (value) {
                    press(value);
                  },
                  items: items.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: TextStyle(fontSize: 8),
                      ),
                    );
                  }).toList()),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              child: Text(
                text,
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
