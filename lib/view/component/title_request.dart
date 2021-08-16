import 'package:cov_app_flutter/model/static/color.dart';
import 'package:cov_app_flutter/model/static/size.dart';
import 'package:flutter/material.dart';

class TitleUI extends StatelessWidget {
  final String title;
  const TitleUI({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class DrawTitle extends StatelessWidget {
  final double size;
  const DrawTitle({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: kDefaultPadding,
          bottom: kDefaultPadding * 0.5,
          left: kDefaultPadding),
      height: 5,
      width: size,
      color: Colors.black,
    );
  }
}

class TitlePopup extends StatelessWidget {
  const TitlePopup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.2),
      color: kGrey.withOpacity(0.6),
      width: _width,
      child: Text(
        'Danh sách được sắp xếp theo thời gian',
        style: TextStyle(color: Colors.black, letterSpacing: 2, fontSize: 12),
      ),
    );
  }
}

class TitleButton extends StatelessWidget {
  final Function press;
  const TitleButton({Key key, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      width: _width * 0.95,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 6.0,
                color: kGrey.withOpacity(0.3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: Text(
                'Bạn có muốn thêm cột đo xăng dầu',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              )),
          GestureDetector(
            onTap: () {
              press();
            },
            child: Container(
              margin: EdgeInsets.only(
                  right: kDefaultPadding, top: kDefaultPadding * 0.5),
              padding: EdgeInsets.all(kDefaultPadding * 0.5),
              decoration: BoxDecoration(color: kGrey.withOpacity(0.6)),
              child: Text('Xác Nhận'),
            ),
          )
        ],
      ),
    );
  }
}
