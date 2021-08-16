import 'package:cov_app_flutter/controller/createPDF/PdfApi.dart';
import 'package:cov_app_flutter/controller/createPDF/pdf.dart';
import 'package:cov_app_flutter/controller/provider/public.dart';

import 'package:cov_app_flutter/model/static/color.dart';
import 'package:cov_app_flutter/model/static/size.dart';
import 'package:cov_app_flutter/view/component/textfieldui.dart';
import 'package:cov_app_flutter/view/component/title_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  const Report({
    Key key,
  }) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    Provider.of<Public>(context, listen: false).getListReport();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TitlePopup(),
        DrawTitle(
          size: kDefaultPadding * 3,
        ),
        TitleUI(
          title: 'Danh sách cột đo',
        ),
        TextFieldUi(
          label: 'Thêm Gmail',
          press: (value) {
            Provider.of<Public>(context, listen: false).emailMe = value;
          },
        ),
        Expanded(
          child: Container(
            child: Center(
              child: Consumer<Public>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.listReport.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          // ContainerReport(
                          //   nameCompany: value.listReport[index]['nameCompany'],
                          //   time: value.listReport[index]['time'],
                          //   type: value.listReport[index]['type'],
                          //   press: () async {
                          //     Provider.of<Public>(context, listen: false)
                          //         .setBienBanIndex(index);
                          //     final pdfFile = await PdfAccreditation.generate(
                          //         Provider.of<Public>(context, listen: false)
                          //             .bienBanIndex);
                          //     Provider.of<Public>(context, listen: false)
                          //         .sendEmail(value.listReport[index]['email'],
                          //             pdfFile);
                          //     PdfApi.openFile(pdfFile);
                          //   },
                          // ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        )
      ])),
    );
  }
}

class ContainerReport extends StatelessWidget {
  final String nameCompany;
  final String time;
  final Function press;
  final String type;
  const ContainerReport(
      {Key key, this.nameCompany, this.press, this.time, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 6.0,
                color: kGrey.withOpacity(0.3))
          ]),
      width: _width * 0.95,
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(type == 'Kiểm Tra D'
              ? 'assets/icons/oil.png'
              : 'assets/icons/gas.png'),
          Column(
            children: [
              Text(
                nameCompany,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              SizedBox(
                height: kDefaultPadding * 0.5,
              ),
              Text(
                time,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 10),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              GestureDetector(
                onTap: () {
                  press();
                },
                child: Container(
                  padding: EdgeInsets.all(kDefaultPadding * 0.5),
                  color: kGrey.withOpacity(0.6),
                  child: Container(
                    child: Text(
                      'Bản Kiểm Định',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
