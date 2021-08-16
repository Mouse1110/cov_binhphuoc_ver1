import 'package:cov_app_flutter/controller/provider/public.dart';

import 'package:cov_app_flutter/model/static/size.dart';
import 'package:cov_app_flutter/view/component/container_request.dart';
import 'package:cov_app_flutter/view/component/title_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Request extends StatefulWidget {
  const Request({
    Key key,
  }) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    Provider.of<Public>(context, listen: false).getListRequest();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitlePopup(),
                DrawTitle(
                  size: kDefaultPadding * 3,
                ),
                TitleUI(
                  title: 'Phiếu Yêu Cầu',
                ),
                SizedBox(
                  height: kDefaultPadding * 0.5,
                ),
                Container(
                  width: _width,
                  height: 300,
                  child: Consumer<Public>(
                    builder: (context, value, child) {
                      var list = value.listRequest;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.listRequest.length,
                        itemBuilder: (context, index) {
                          return ContainerRequest(
                            nameCompany: list[index]['nameCompany'],
                            name: list[index]['name'],
                            type: list[index]['type'],
                            phone: list[index]['phone'],
                            email: list[index]['email'],
                            press: () {
                              Provider.of<Public>(context, listen: false)
                                  .setRequestInit(index);
                              Provider.of<Public>(context, listen: false)
                                  .requestSetTrue(index, true);
                              Provider.of<Public>(context, listen: false)
                                  .setPageInit(1);
                            },
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
