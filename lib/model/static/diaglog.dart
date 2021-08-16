import 'package:cov_app_flutter/controller/provider/public.dart';
import 'package:cov_app_flutter/model/OTD/requestOTD.dart';
import 'package:cov_app_flutter/model/static/size.dart';
import 'package:cov_app_flutter/view/component/textfieldui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'config.dart';

class DiaglogUI {
  static void showDialogFormRequest(String title, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return ContainerDiaglog(
            title: title,
          );
        });
  }

  static void showDialogConfig(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfigMail();
      },
    );
  }
}

class ConfigMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Chỉnh sửa thông tin'),
      content: Column(
        children: [
          TextField(
            onChanged: (value) {
              Provider.of<Public>(context, listen: false).emailMe = value;
            },
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
                hintText: "ban***@gmail.com", labelText: "Gmail"),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          TextField(
            onChanged: (value) {
              Provider.of<Public>(context, listen: false).pass = value;
            },
            obscureText: true,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.numberWithOptions(),
            decoration:
                InputDecoration(hintText: "*********", labelText: "Pass Gmail"),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ListTile(
            title: Text('Xác Nhận'),
            onTap: () {
              Provider.of<Public>(context, listen: false).sendMailID();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class ContainerDiaglog extends StatefulWidget {
  final String title;
  const ContainerDiaglog({Key key, this.title}) : super(key: key);

  @override
  _ContainerDiaglogState createState() => _ContainerDiaglogState();
}

class _ContainerDiaglogState extends State<ContainerDiaglog> {
  void sendRequest(RequestOTD data) async {
    var url = Uri.parse('${ip}/request');
    var response = await http.post(
      url,
      body: data.toJson(),
    );
    print('Response status: ${response.statusCode}');
  }

  @override
  void initState() {
    super.initState();
    _requestOTD = new RequestOTD();
    var now = DateTime.now();
    _requestOTD.time = '$now'.substring(0, 9);
  }

  String valueChoose;
  List item = ['Kiểm Tra Xăng', 'Kiểm Tra Dầu'];
  RequestOTD _requestOTD;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
          child: Container(
              child: Column(
        children: [
          DropdownButton(
              hint: Text('Loại yêu cầu'),
              value: valueChoose,
              onChanged: (value) {
                setState(() {
                  valueChoose = value;
                  _requestOTD.type = value;
                });
              },
              items: item.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList()),
          SizedBox(
            height: kDefaultPadding * 0.5,
          ),
          TextFieldUi(
            text: '',
            label: 'Tên người liên hệ',
            press: (value) {
              _requestOTD.name = value;
            },
          ),
          TextFieldUi(
            text: '',
            label: 'Số điện thoại',
            press: (value) {
              _requestOTD.phone = value;
            },
          ),
          TextFieldUi(
            text: '',
            label: 'Email',
            press: (value) {
              _requestOTD.email = value;
            },
          ),
          TextFieldUi(
            text: '',
            label: 'Tên công ty',
            press: (value) {
              _requestOTD.nameCompany = value;
            },
          ),
          TextFieldUi(
            text: '',
            label: 'Địa chỉ',
            press: (value) {
              _requestOTD.local = value;
            },
          ),
          TextFieldUi(
            text: '',
            label: 'Số trụ',
            press: (value) {
              _requestOTD.soTru = value;
            },
          ),
          TextFieldUi(
            text: '',
            label: 'Ghi chú',
            press: (value) {
              _requestOTD.title = value;
            },
          ),
          TextButton(
              onPressed: () {
                sendRequest(_requestOTD);
                Navigator.pop(context);
              },
              child: Text('Xác Nhận')),
        ],
      ))),
    );
  }
}
