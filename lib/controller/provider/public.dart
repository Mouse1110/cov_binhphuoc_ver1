import 'dart:convert';
import 'dart:io';

import 'package:cov_app_flutter/model/OTD/reportOTD.dart';
import 'package:cov_app_flutter/model/OTD/requestOTD.dart';
import 'package:cov_app_flutter/model/static/config.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class Public extends ChangeNotifier {
  int pageInit;

  RequestOTD requestOTD;
  ReportOTD reportOTD;
  dynamic bienBanIndex;
  List<dynamic> listRequest;
  List<dynamic> listReport;
  dynamic showRequestInit;

  String emailMe = '';
  String pass = '';
  Public() {
    requestOTD = new RequestOTD();
    reportOTD = new ReportOTD();
    listRequest = [];
    listReport = [];
    pageInit = 0;
  }
  void setPageInit(int i) {
    pageInit = i;
    print(pageInit);
    notifyListeners();
  }

  void sendMailID() async {
    var url = Uri.parse('${ip}/setup');
    var response = await http.post(url, body: {'gmail': emailMe, 'pass': pass});
    notifyListeners();
  }

  void sendEmail(String email, File pdf) async {
    final smtpServer = gmail('luutru.banguyen@gmail.com', '0382292563');

    final message = Message()
      ..from = Address('luutru.banguyen@gmail.com', 'COV')
      ..recipients.add(email)
      ..subject = 'COV THÔNG BÁO'
      ..text = 'BIÊN BẢN KIỂM ĐỊNH ĐÃ YÊU CẦU !'
      ..attachments.add(FileAttachment(pdf));

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  void setBienBanIndex(int i) {
    bienBanIndex = listReport[i];
    notifyListeners();
  }

  void requestSetTrue(int i, bool isSuccess) async {
    String type = isSuccess ? 'et' : 'rm';
    var url = Uri.parse('${ip}/request/${listRequest[i]['phone']}?type=$type');
    var response = await http.get(
      url,
    );
    notifyListeners();
  }

  void requestFill(RequestOTD text) {
    requestOTD = text;
    notifyListeners();
  }

  void setReportDefault() {
    reportOTD.nameCompany = showRequestInit['nameCompany'];
    reportOTD.local = showRequestInit['local'];
    reportOTD.email = showRequestInit['email'];
    reportOTD.phone = showRequestInit['phone'];
    reportOTD.type = showRequestInit['type'];
    notifyListeners();
  }

  void setRequestInit(int i) {
    showRequestInit = listRequest[i];
    print(showRequestInit);
    notifyListeners();
  }

  void getListRequest() async {
    var url = Uri.parse('$ip/request');
    print(url);
    var response = await http.get(url);
    listRequest = jsonDecode(response.body);
    notifyListeners();
  }

  void getListReport() async {
    var url = Uri.parse('$ip/report');
    var report = await http.get(url);
    listReport = jsonDecode(report.body);
    notifyListeners();
  }

  void uploadReport() async {
    var url = Uri.parse('${ip}/report');
    var response = await http.post(
      url,
      body: reportOTD.toJson(),
    );
    print('Response status: ${response.statusCode}');
  }
}
