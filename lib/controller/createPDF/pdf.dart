// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';

// import 'PdfApi.dart';

// class PdfAccreditation {
//   static Future<File> generate(dynamic data) async {
//     var font = await rootBundle.load("assets/fonts/OpenSans-Regular.ttf");
//     var ttf = Font.ttf(font);
//     final pdf = Document();

//     pdf.addPage(MultiPage(
//         pageFormat: PdfPageFormat.a3,
//         build: (context) => [
//               buildTitle(ttf, data),
//               buildLayout(ttf, data),
//               buildFooter(ttf, data),
//             ]));

//     return PdfApi.saveDocument(name: 'accreditation.pdf', pdf: pdf);
//   }

//   static Widget buildFooter(var ttf, dynamic data) =>
//       Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//         SizedBox(height: PdfPageFormat.cm * 3),
//         Text('Bình Phước, ngày 16 tháng 04 năm 2021',
//             style: TextStyle(fontSize: 18, font: ttf)),
//         Text(' Date of issue', style: TextStyle(fontSize: 18, font: ttf)),
//         Row(children: [])
//       ]);

//   static Widget buildTitle(var ttf, dynamic data) =>
//       Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         SizedBox(height: PdfPageFormat.cm * 3),
//         Center(
//           child: Text('GIẤY CHỨNG NHẬN KIỂM ĐỊNH',
//               style: TextStyle(
//                   fontSize: 24, fontWeight: FontWeight.bold, font: ttf)),
//         ),
//         SizedBox(height: 0.4 * PdfPageFormat.cm),
//         Text('CERTIFICATE OF VERIFICATION',
//             style: TextStyle(fontSize: 22, font: ttf)),
//         SizedBox(height: 0.4 * PdfPageFormat.cm),
//         Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Text('Số (N0) :', style: TextStyle(fontSize: 18, font: ttf)),
//           Text(data['soGiayChungNhan'],
//               style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//       ]);

//   static Widget buildLayout(var ttf, dynamic data) =>
//       Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         SizedBox(height: PdfPageFormat.cm * 2),
//         Row(children: [
//           Text('Tên phương tiện đo / Measuring instrument :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//           Text(data['nhieuLieu'], style: TextStyle(fontSize: 16, font: ttf)),
//         ]),
//         Row(children: [
//           Text('Số / Serial No :', style: TextStyle(fontSize: 18, font: ttf)),
//           Text(data['soSerial'], style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Row(children: [
//           Text('Kiểu / Type :', style: TextStyle(fontSize: 18, font: ttf)),
//           Text('${data['kieuMay']} - ${data['kieu']}',
//               style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Row(children: [
//           Text('Nơi sản xuất / Manufacturer :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//           Text(data['nuocSanXuat'], style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Row(children: [
//           Text('Năm / Year :', style: TextStyle(fontSize: 18, font: ttf)),
//           Text(data['namSanXuat'], style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text('Đặc trưng kỹ thuật đo lường / Specifications :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//         ),
//         Container(
//             margin: EdgeInsets.only(left: PdfPageFormat.cm),
//             child: Column(children: [
//               Row(children: [
//                 Text('- Lưu lượng lớn nhất / Max flow rate :',
//                     style: TextStyle(fontSize: 18, font: ttf)),
//                 Text(data['luuLuongLonNhat'],
//                     style: TextStyle(fontSize: 18, font: ttf)),
//               ]),
//               Row(children: [
//                 Text(
//                     '- Lưu lượng lớn nhất đạt được / Attainable max flow rate :',
//                     style: TextStyle(fontSize: 18, font: ttf)),
//                 Text(data['luuLuongLonNhatDatDuocT'],
//                     style: TextStyle(fontSize: 18, font: ttf)),
//               ]),
//               Row(children: [
//                 Text('- Lưu lượng nhỏ nhất / Min flow rate :',
//                     style: TextStyle(fontSize: 18, font: ttf)),
//                 Text(data['luuLuongLonNhatDatDuocL'],
//                     style: TextStyle(fontSize: 18, font: ttf)),
//               ]),
//               Row(children: [
//                 Text('- Lượng cấp phát tối thiểu / Minimum delivery :',
//                     style: TextStyle(fontSize: 18, font: ttf)),
//                 Text(data['luuLuongCapPhatToiThieu'],
//                     style: TextStyle(fontSize: 18, font: ttf)),
//               ]),
//               Row(children: [
//                 Text('- Cấp chính xác / Accuracy class :',
//                     style: TextStyle(fontSize: 18, font: ttf)),
//                 Text(data['capChinhXac'],
//                     style: TextStyle(fontSize: 18, font: ttf)),
//               ]),
//             ])),
//         Row(children: [
//           Text('Đơn vị sử dụng/ User :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Row(children: [
//           Text('Nơi sử dụng / Place :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//           Text(data['nameCompany'], style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Row(children: [
//           Text('Điện thoại / Phone :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//           Text(data['phone'], style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Row(children: [
//           Text('Phương pháp kiểm định / Method of verification :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//           Text('ĐLVN 10 : 2017', style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Text('CỘT ĐO XĂNG DẦU - QUY TRÌNH KIỂM ĐỊNH',
//             style: TextStyle(fontSize: 18, font: ttf)),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text('Kết luận / Conclusion',
//               style: TextStyle(fontSize: 18, font: ttf)),
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//               'Đạt yêu cầu kỹ thuật đo lường / This instrument has been met the request of metrological technic.',
//               style: TextStyle(fontSize: 18, font: ttf)),
//         ),
//         Row(children: [
//           Text('Số tem kiểm định / Verification stamp No :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//           Text(data['soTemKD'], style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//         Row(children: [
//           Text('Thời hạn đến  / Valid until (*) :',
//               style: TextStyle(fontSize: 18, font: ttf)),
//         ]),
//       ]);
// }
