import 'package:cov_app_flutter/model/static/color.dart';
import 'package:cov_app_flutter/model/static/size.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContainerRequested extends StatelessWidget {
  final String nameCompany;
  final Function press;
  const ContainerRequested({Key key, this.nameCompany, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
          margin: EdgeInsets.only(bottom: kDefaultPadding * 0.5),
          decoration: BoxDecoration(
              color: kGrey,
              border: Border.all(width: 1, style: BorderStyle.solid)),
          padding: EdgeInsets.all(kDefaultPadding),
          width: size.width * 0.95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$nameCompany',
                style: TextStyle(
                    color: Colors.white, fontSize: 16, letterSpacing: 2),
              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(4),
                  child: Text(
                    'Xem thêm',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.w300),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerRequest extends StatelessWidget {
  final Function press;
  final String nameCompany;
  final String name;
  final String type;
  final String phone;
  final String email;
  const ContainerRequest(
      {Key key,
      this.press,
      this.email,
      this.name,
      this.nameCompany,
      this.phone,
      this.type})
      : super(key: key);
  void custom(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else
      print("NOT");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        custom('tel:$phone');
      },
      child: Container(
        margin: EdgeInsets.all(kDefaultPadding * 0.5),
        width: size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 5,
                color: kColorOutSide.withOpacity(0.3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: kGrey,
              ),
              padding: EdgeInsets.all(kDefaultPadding),
              width: size.width * 0.95,
              child: Text(
                '$nameCompany',
                style: TextStyle(
                    color: Colors.white, fontSize: 16, letterSpacing: 2),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  top: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$type',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '$name',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '$phone',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '$email',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: kDefaultPadding * 0.5,
                      ),
                      GestureDetector(
                        onTap: () {
                          press();
                        },
                        child: Container(
                          padding: EdgeInsets.all(kDefaultPadding * 0.5),
                          color: kGrey.withOpacity(0.6),
                          child: Container(
                            child: Text('Xác Nhận'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      )
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MiddleContainerRequest extends StatelessWidget {
  final String nameCompany;
  final String name;
  final String time;
  final String type;
  final String email;
  final String phone;
  final String title;
  const MiddleContainerRequest(
      {Key key,
      this.email,
      this.name,
      this.nameCompany,
      this.phone,
      this.title,
      this.type,
      this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              time,
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 2,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: Text(
              nameCompany,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: kDefaultPadding * 0.5,
          ),
          Text(
            type,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: kDefaultPadding * 0.5,
          ),
          Text(
            email,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: kDefaultPadding * 0.5,
          ),
          Text(
            phone,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Center(
            child: Container(
              width: size.width * 0.8,
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 6.0,
                        color: kGrey.withOpacity(0.3))
                  ]),
              child: Center(
                  child: Text(
                '"$title"',
                textAlign: TextAlign.justify,
              )),
            ),
          )
        ],
      ),
    );
  }
}
