import 'dart:convert';

import 'package:cov_app_flutter/controller/provider/public.dart';
import 'package:cov_app_flutter/model/static/color.dart';
import 'package:cov_app_flutter/model/static/config.dart';

import 'package:cov_app_flutter/model/static/size.dart';
import 'package:cov_app_flutter/view/component/container_request.dart';
import 'package:cov_app_flutter/view/component/title_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class RequestShow extends StatefulWidget {
  @override
  _RequestShowState createState() => _RequestShowState();
}

class _RequestShowState extends State<RequestShow> {
  List<dynamic> _listReport = [];

  void getListReportWithPhone(String phone) async {
    var url = Uri.parse('$ip/report/list/$phone');
    print(url);
    print(
        '----------------------------------------------------------------------------');
    var datas = await http.get(url);
    _listReport = jsonDecode(datas.body);
    print(_listReport[0]);
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    String phone =
        Provider.of<Public>(context, listen: false).showRequestInit['phone'];

    setState(() {
      getListReportWithPhone(phone);
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawTitle(
                  size: kDefaultPadding * 3,
                ),
                TitleUI(
                  title: 'Thông Tin',
                ),
                Consumer<Public>(
                  builder: (context, value, child) {
                    return MiddleContainerRequest(
                      nameCompany: value.showRequestInit['nameCompany'],
                      name: value.showRequestInit['name'],
                      time: value.showRequestInit['time'],
                      type: value.showRequestInit['type'],
                      email: value.showRequestInit['email'],
                      phone: value.showRequestInit['phone'],
                      title: value.showRequestInit['title'],
                    );
                  },
                ),
                DrawTitle(
                  size: _width * 0.9,
                ),
                TitleUI(
                  title: 'Cột đo xăng dầu',
                ),
                SizedBox(
                  height: kDefaultPadding * 0.5,
                ),
                _listReport.length > 0
                    ? Container(
                        width: _width,
                        height: 70,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 0.5),
                          scrollDirection: Axis.horizontal,
                          itemCount: _listReport.length,
                          itemBuilder: (context, index) {
                            return ContainerReportTime(
                              time: _listReport[index]['time'],
                              press: () {},
                            );
                          },
                        ),
                      )
                    : SizedBox(),
                Center(
                  child: TitleButton(
                    press: () {
                      Provider.of<Public>(context, listen: false)
                          .setPageInit(2);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerReportTime extends StatelessWidget {
  final String time;
  final Function press;
  ContainerReportTime({this.press, this.time});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
          width: 120,
          margin: EdgeInsets.only(bottom: kDefaultPadding * 0.5),
          decoration: BoxDecoration(
              color: kGrey,
              border: Border.all(width: 1, style: BorderStyle.solid)),
          padding: EdgeInsets.all(kDefaultPadding * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/gas.png',
                width: 32,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '$time',
                    style: TextStyle(
                        color: Colors.white, fontSize: 10, letterSpacing: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
