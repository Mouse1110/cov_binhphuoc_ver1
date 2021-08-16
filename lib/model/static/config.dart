import 'package:cov_app_flutter/view/sceen/accreditation.dart';
import 'package:cov_app_flutter/view/sceen/page_input.dart';
import 'package:cov_app_flutter/view/sceen/report.dart';
import 'package:cov_app_flutter/view/sceen/request.dart';
import 'package:cov_app_flutter/view/sceen/requestshow.dart';
import 'package:flutter/widgets.dart';

const ip = 'http://192.168.1.8:3000';
String username = 'luutru.banguyen@gmail.com';
String password = '0382292563';

class Config {
  static List<Widget> widgetInput = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5()
  ];
  static List<Widget> widgetSceen = [
    Request(),
    RequestShow(),
    InputReport(),
    Report(),
    Accreditation()
  ];
  static List<String> titleAppBar = [
    'ĐĂNG KÝ YÊU CẦU',
    'PHIẾU ĐĂNG KÝ',
    'NHẬP CỘT ĐO XĂNG DẦU',
    'HIỆN TRẠNG CỘT ĐO',
    'KIỂM ĐỊNH'
  ];
}
