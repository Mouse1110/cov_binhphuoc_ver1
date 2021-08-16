import 'package:cov_app_flutter/model/static/color.dart';
import 'package:cov_app_flutter/model/static/size.dart';
import 'package:cov_app_flutter/view/component/title_request.dart';
import 'package:flutter/material.dart';

class Accreditation extends StatefulWidget {
  @override
  _AccreditationState createState() => _AccreditationState();
}

class _AccreditationState extends State<Accreditation> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DrawTitle(
        size: kDefaultPadding * 3,
      ),
      TitleUI(
        title: 'Danh Sách Kiểm Định',
      ),
      SizedBox(
        height: kDefaultPadding * 0.5,
      ),
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.2),
        color: kGrey.withOpacity(0.6),
        width: _width,
        child: Text(
          'Danh Sách Gần Hết Hạn (5 ngày)',
          style: TextStyle(color: Colors.black, letterSpacing: 2, fontSize: 12),
        ),
      ),
    ])));
  }
}

class ContainerAccreditationHH extends StatelessWidget {
  final String text;
  final String time;
  final Function press;
  const ContainerAccreditationHH({Key key, this.press, this.text, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding * 0.5),
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
                padding: EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                    Text(
                      time,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                  ],
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
                child: Text('Gửi Thông Báo'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
