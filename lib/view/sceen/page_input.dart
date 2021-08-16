import 'package:cov_app_flutter/controller/provider/public.dart';

import 'package:cov_app_flutter/model/static/color.dart';
import 'package:cov_app_flutter/model/static/config.dart';
import 'package:cov_app_flutter/model/static/size.dart';
import 'package:cov_app_flutter/view/component/combo_box.dart';
import 'package:cov_app_flutter/view/component/design_input.dart';
import 'package:cov_app_flutter/view/component/textfieldui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputReport extends StatefulWidget {
  const InputReport({
    Key key,
  }) : super(key: key);

  @override
  _InputReportState createState() => _InputReportState();
}

class _InputReportState extends State<InputReport> {
  int initPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                TitleReport(
                  text: 'Thông tin',
                  color: initPage == 0
                      ? kGrey.withOpacity(0.6)
                      : kGrey.withOpacity(0.1),
                  press: () {
                    setState(() {
                      initPage = 0;
                    });
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                TitleReport(
                  text: 'Bên ngoài',
                  color: initPage == 1
                      ? kGrey.withOpacity(0.6)
                      : kGrey.withOpacity(0.1),
                  press: () {
                    setState(() {
                      initPage = 1;
                    });
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                TitleReport(
                  text: 'Kỹ thuật',
                  color: initPage == 2
                      ? kGrey.withOpacity(0.6)
                      : kGrey.withOpacity(0.1),
                  press: () {
                    setState(() {
                      initPage = 2;
                    });
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                TitleReport(
                  text: 'Đo lường',
                  color: initPage == 3
                      ? kGrey.withOpacity(0.6)
                      : kGrey.withOpacity(0.1),
                  press: () {
                    setState(() {
                      initPage = 3;
                    });
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                TitleReport(
                  text: 'Cơ cấu in',
                  color: initPage == 4
                      ? kGrey.withOpacity(0.6)
                      : kGrey.withOpacity(0.1),
                  press: () {
                    setState(() {
                      initPage = 4;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(child: Config.widgetInput[initPage]),
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({
    Key key,
  }) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String valueChoose;
  List items = ['Ban đầu', 'Định kỳ', 'Sau sửa chửa'];
  String valueType;
  List types = ['Cơ khí Mechanic /', 'Điện tử Electronic /'];
  String valueNhienLieu;
  List nhienLieu = [
    'CỘT ĐO XĂNG E5 RON 92-II / FUEL DISPENSER',
    'CỘT ĐO XĂNG E5 RON 92-III / FUEL DISPENSER',
    'CỘT ĐO XĂNG RON 95-III / FUEL DISPENSER',
    'CỘT ĐO XĂNG RON 95-IV / FUEL DISPENSER',
    'CỘT ĐO DẦU DO 0.05S-II / FUEL DISPENSER',
    'CỘT ĐO DẦU DO 0.001S-V / FUEL DISPENSER'
  ];
  String valueNuoc;
  List nuocsx = [
    'Hàn Quốc',
    'Mỹ',
    'Nga',
    'Nhật',
    'Pháp',
    'Singapore',
    'Thụy Sĩ',
    'Trung Quốc',
    'Việt Nam',
    'Ý',
    'Không rõ'
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            TitleInput(
              text: 'Nhập thêm thông tin',
            ),
            TextFieldUi(
              label: 'Số giấy chứng nhận',
              press: (value) {
                Provider.of<Public>(context, listen: false)
                    .reportOTD
                    .soGiayChungNhan = value;
              },
            ),
            TextFieldUi(
              label: 'Điều kiện môi trường',
              press: (value) {
                Provider.of<Public>(context, listen: false)
                    .reportOTD
                    .dieuKienMoiTruong = value;
              },
            ),
            ComboBox(
              width: _width,
              valueChoose: valueChoose,
              items: items,
              title: 'Chế độ kiểm định',
              press: (value) {
                setState(() {
                  valueChoose = value;
                  Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .cheDoKiemDinh = value;
                });
              },
            ),
            TextFieldUi(
              label: 'Kiểm định viên',
              press: (value) {
                Provider.of<Public>(context, listen: false)
                    .reportOTD
                    .kiemDinhVien = value;
              },
            ),
            TextFieldUi(
              label: 'Số serial',
              press: (value) {
                Provider.of<Public>(context, listen: false).reportOTD.soSerial =
                    value;
              },
            ),
            TextFieldUi(
              label: 'Kiểu',
              press: (value) {
                Provider.of<Public>(context, listen: false).reportOTD.kieu =
                    value;
              },
            ),
            ComboBox(
              width: _width,
              valueChoose: valueType,
              title: 'Kiểu máy',
              items: types,
              press: (value) {
                setState(() {
                  valueType = value;
                  Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .kieuMay = value;
                });
              },
            ),
            ComboBox(
              width: _width,
              title: 'Nước sản xuất',
              valueChoose: valueNuoc,
              items: nuocsx,
              press: (value) {
                setState(() {
                  valueNuoc = value;
                  Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .nuocSanXuat = value;
                });
              },
            ),
            TextFieldUi(
              label: 'Cơ sở sản xuất',
              press: (value) {
                Provider.of<Public>(context, listen: false)
                    .reportOTD
                    .coSoSanXuat = value;
              },
            ),
            TextFieldUi(
              label: 'Năm sản xuất',
              press: (value) {
                Provider.of<Public>(context, listen: false)
                    .reportOTD
                    .namSanXuat = value;
              },
            ),
            TextFieldUi(
              label: 'Số tem KĐ',
              press: (value) {
                Provider.of<Public>(context, listen: false).reportOTD.soTemKD =
                    value;
              },
            ),
            ComboBox(
              width: _width,
              title: 'Nhiên liệu',
              valueChoose: valueNhienLieu,
              items: nhienLieu,
              press: (value) {
                setState(() {
                  valueNhienLieu = value;
                  Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .nhieuLieu = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({
    Key key,
  }) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: kDefaultPadding),
          child: Column(
            children: [
              SwitchListTile(
                  title: Text('7.1.1'),
                  subtitle: Text(
                    'Kiểm tra sự phù hợp của các bộ phận, chi tiết chức năng của CĐXD với đặc tính kỹ thuật đo lường chính ghi trong quyết định phê duyệt mẫu',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .checkOut11,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .checkOut11 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.1.2'),
                  subtitle: Text(
                    'Kiểm tra đảm bảo ngăn ngừa, phòng chống các cơ sở tháo lắp thay thế ICchương trình, nạp lại chươn trình hoặc tác động làm thay đổi các đặc tinh kỹ thuật đo lường chính của CĐXD trong sử dụng',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .checkOut12,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .checkOut12 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.1.3'),
                  subtitle: Text(
                    'Kiểm tra việc bảo đảm yêu cầu mới 100% đối với các bộ phận chi tiết hức năng của CĐXD (áp dụng đối với CĐXD được kiểm định lần đầu tiên trước khi đưa vào sử dụng',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .checkOut13,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .checkOut13 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.1.4'),
                  subtitle: Text(
                    'Kiểm tra hiện trạng CĐXD (áp dụng cho kiểm định định kỳ, kiểm định sau sửa chữa)',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .checkOut14,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .checkOut14 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.1.5'),
                  subtitle: Text(
                    'Kiểm tra cầu dao, thiết bị đóng ngắt nguồn điện',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .checkOut15,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .checkOut15 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.1.6'),
                  subtitle: Text(
                    'Kiểm tra công tắc điều khiển',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .checkOut16,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .checkOut16 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.1.6'),
                  subtitle: Text(
                    'Kiểm tra bên ngoài CĐXD theo các yêu cầu quy định tại phụ lục 1 của ĐLVN 97 hiện hành',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: (Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .nhanHieu ==
                              true &&
                          Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .cacBoPhanChinh ==
                              true &&
                          Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .kinhBaoVe ==
                              true &&
                          Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .ongCaoSu ==
                              true)
                      ? true
                      : false,
                  onChanged: (value) {}),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  children: [
                    SwitchListTile(
                        title: Text(''),
                        subtitle: Text(
                          'Nhãn hiệu, ký hiệu',
                          style: TextStyle(fontSize: 12),
                        ),
                        value: Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .nhanHieu,
                        onChanged: (value) {
                          setState(() {
                            Provider.of<Public>(context, listen: false)
                                .reportOTD
                                .nhanHieu = value;
                          });
                        }),
                    SwitchListTile(
                        title: Text(''),
                        subtitle: Text(
                          'Các bộ phận chính',
                          style: TextStyle(fontSize: 12),
                        ),
                        value: Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .cacBoPhanChinh,
                        onChanged: (value) {
                          setState(() {
                            Provider.of<Public>(context, listen: false)
                                .reportOTD
                                .cacBoPhanChinh = value;
                          });
                        }),
                    SwitchListTile(
                        title: Text(''),
                        subtitle: Text(
                          'Kính bảo vệ, kính quan sát',
                          style: TextStyle(fontSize: 12),
                        ),
                        value: Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .kinhBaoVe,
                        onChanged: (value) {
                          setState(() {
                            Provider.of<Public>(context, listen: false)
                                .reportOTD
                                .kinhBaoVe = value;
                          });
                        }),
                    SwitchListTile(
                        title: Text(''),
                        subtitle: Text(
                          'Ống cao su',
                          style: TextStyle(fontSize: 12),
                        ),
                        value: Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .ongCaoSu,
                        onChanged: (value) {
                          setState(() {
                            Provider.of<Public>(context, listen: false)
                                .reportOTD
                                .ongCaoSu = value;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
            ],
          )),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({
    Key key,
  }) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool checkXoaSo = false;
  double vDatTruoc;
  double vDoDuoc;
  double donGia;
  double tienHienThi;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: kDefaultPadding),
          child: Column(
            children: [
              SwitchListTile(
                  title: Text('7.2.1'),
                  subtitle: Text(
                    'Kiểm tra sơ bộ',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .kyThuat21,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .kyThuat21 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.2.2'),
                  subtitle: Text(
                    'Kiểm tra độ kín',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .kyThuat22,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .kyThuat22 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.2.3'),
                  subtitle: Text(
                    Provider.of<Public>(context, listen: false)
                                .reportOTD
                                .kieuMay ==
                            'Cơ khí Mechanic /'
                        ? 'Đối với CĐXD có chỉ thị cơ khí:'
                        : 'Đối với CĐXD có chỉ thị điện tử:',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .kyThuat23,
                  onChanged: (value) {
                    if (Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .kieuMay !=
                        'Cơ khí Mechanic /') {
                      setState(() {
                        Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .kyThuat23 = value;
                      });
                    }
                  }),
              Provider.of<Public>(context, listen: false).reportOTD.kieuMay ==
                      'Cơ khí Mechanic /'
                  ? Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          TextFieldUi(
                            label: 'Thể tích đặt trước(L): ',
                            press: (value) {
                              vDatTruoc = double.parse(value);
                            },
                          ),
                          TextFieldUi(
                            label: 'Đơn giá(đ): ',
                            press: (value) {
                              if (value != '') {
                                donGia = double.parse(value);
                              }
                            },
                          ),
                          TextFieldUi(
                            label: 'Giá tiền hiển thị(đ): ',
                            press: (value) {
                              if (value != '') {
                                tienHienThi = double.parse(value);
                              }
                            },
                          ),
                          TextFieldUi(
                            label: 'Thể tích đo được sau khi xóa số(L): ',
                            press: (value) {
                              if (value != '') {
                                vDoDuoc = double.parse(value);

                                if (vDoDuoc <=
                                        vDatTruoc + (vDatTruoc / 2) * 0.01 &&
                                    vDoDuoc >=
                                        vDatTruoc - (vDatTruoc / 2) * 0.01) {
                                  if (tienHienThi <=
                                          (vDatTruoc + (vDatTruoc / 2) * 0.01) *
                                              donGia &&
                                      tienHienThi >=
                                          (vDatTruoc - (vDatTruoc / 2) * 0.01) *
                                              donGia) {
                                    setState(() {
                                      Provider.of<Public>(context,
                                              listen: false)
                                          .reportOTD
                                          .kyThuat23 = true;
                                    });
                                  } else
                                    setState(() {
                                      Provider.of<Public>(context,
                                              listen: false)
                                          .reportOTD
                                          .kyThuat23 = false;
                                    });
                                } else
                                  setState(() {
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .kyThuat23 = false;
                                  });
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: kDefaultPadding,
                    ),
              SwitchListTile(
                  title: Text('7.2.4'),
                  subtitle: Text(
                    'Kiểm tra cơ cấu tự ngắt (nếu có)',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .kyThuat24,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .kyThuat24 = value;
                    });
                  }),
            ],
          )),
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({
    Key key,
  }) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  double luuLuongLonTrenNhanMac = 0;
  double kiemDinh = 0;
  bool saiSoLonNhat = false;
  bool saiSoNhoNhat = false;
  int capPhatLonNhat = 0;
  int capPhatNhoNhat = 0;

  bool hieuChinh = false;
  void checkDieuKien() {
    String text =
        Provider.of<Public>(context, listen: false).reportOTD.cheDoKiemDinh;
    if (text != '') {
      text == 'Ban đầu' ? kiemDinh = 0.3 : kiemDinh = 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    checkDieuKien();
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: kDefaultPadding),
          child: Column(
            children: [
              SwitchListTile(
                  title: Text('7.3.1'),
                  subtitle: Text(
                    'Lưu lượng lớn nhất đạt được',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .doLuong31,
                  onChanged: (value) {}),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFieldUi(
                label: 'Lưu lượng lớn nhất ghi trên nhãn mác',
                text: '40 L/min',
                press: (value) {
                  if (value != '') {
                    luuLuongLonTrenNhanMac = double.parse(value);
                  }
                },
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              TextFieldUi(
                label: 'Lưu lượng lớn nhất đạt được	(Thời gian)',
                text: '10 s',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .luuLuongLonNhatDatDuocT = double.parse(value);
                  }
                },
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              TextFieldUi(
                label: 'Lưu lượng lớn nhất đạt được (Thể tích)',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .luuLuongLonNhatDatDuocL = double.parse(value);

                    double vFD = (Provider.of<Public>(context, listen: false)
                                .reportOTD
                                .luuLuongLonNhatDatDuocL *
                            60) /
                        Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .luuLuongLonNhatDatDuocT;
                    vFD >= luuLuongLonTrenNhanMac / 2
                        ? setState(() {
                            Provider.of<Public>(context, listen: false)
                                .reportOTD
                                .doLuong31 = true;
                          })
                        : setState(() {
                            Provider.of<Public>(context, listen: false)
                                .reportOTD
                                .doLuong31 = false;
                          });
                  }
                },
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              // Kiểm tra sai số
              SwitchListTile(
                  title: Text('7.3.2'),
                  subtitle: Text(
                    'Kiểm tra sai số',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .doLuong32,
                  onChanged: (value) {}),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: SwitchListTile(
                    title: Text(''),
                    subtitle: Text(
                      'Lưu lượng lớn nhất',
                      style: TextStyle(fontSize: 12),
                    ),
                    value: saiSoLonNhat,
                    onChanged: (value) {}),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFieldUi(
                label: 'Thể tích lớn nhất VREF',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoLonNhatVREF = double.parse(value);
                  }
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 2, vertical: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tiến hành cấp phát lần",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  color: kColorOutSide.withOpacity(0.3))
                            ]),
                        padding: EdgeInsets.all(8),
                        child: Text("$capPhatLonNhat"))
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              TextFieldUi(
                label: 'Thể tích đo được',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoLonNhatVFD1 = double.parse(value);

                    setState(() {
                      Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .saiSoLonNhatVFD2 !=
                              null
                          ? capPhatLonNhat = 2
                          : capPhatLonNhat = 1;

                      double vFD = double.parse(value);
                      double vREF = Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .saiSoLonNhatVREF;
                      if ((100 * (vFD - vREF) / vREF).abs() <= kiemDinh) {
                        saiSoLonNhat = true;
                      } else
                        saiSoLonNhat = false;
                    });
                  } else {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoLonNhatVFD1 = null;
                    setState(() {
                      capPhatLonNhat--;
                    });
                  }
                },
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              TextFieldUi(
                label: 'Thể tích đo được',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoLonNhatVFD2 = double.parse(value);
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .saiSoLonNhatVFD1 !=
                              null
                          ? capPhatLonNhat = 2
                          : capPhatLonNhat = 1;

                      double vFD = double.parse(value);
                      double vREF = Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .saiSoLonNhatVREF;
                      if ((100 * (vFD - vREF) / vREF).abs() <= kiemDinh) {
                        saiSoLonNhat = true;
                      } else
                        saiSoLonNhat = false;
                    });
                  } else {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoLonNhatVFD2 = null;
                    setState(() {
                      capPhatLonNhat--;
                    });
                  }
                },
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              // Sai số lớn nhất đo được trước hiệu chỉnh
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: SwitchListTile(
                    title: Text(''),
                    subtitle: Text(
                      'Lưu lượng nhỏ nhất',
                      style: TextStyle(fontSize: 12),
                    ),
                    value: saiSoNhoNhat,
                    onChanged: (value) {}),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextFieldUi(
                label: 'Thể tích nhỏ nhất VREF',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoNhoNhatVREF = double.parse(value);
                  }
                },
              ),

              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 2, vertical: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tiến hành cấp phát lần",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  color: kColorOutSide.withOpacity(0.3))
                            ]),
                        padding: EdgeInsets.all(8),
                        child: Text("$capPhatNhoNhat"))
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              TextFieldUi(
                label: 'Thể tích đo được',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoNhoNhatVFD1 = double.parse(value);

                    setState(() {
                      Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .saiSoNhoNhatVFD2 !=
                              null
                          ? capPhatNhoNhat = 2
                          : capPhatNhoNhat = 1;

                      double vFD = double.parse(value);
                      double vREF = Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .saiSoNhoNhatVREF;
                      if ((100 * (vFD - vREF) / vREF).abs() <= kiemDinh) {
                        saiSoNhoNhat = true;
                      } else
                        saiSoNhoNhat = false;
                    });
                  } else {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoNhoNhatVFD1 = null;
                    setState(() {
                      capPhatNhoNhat--;
                    });
                  }
                },
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              TextFieldUi(
                label: 'Thể tích đo được',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoNhoNhatVFD2 = double.parse(value);
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .saiSoNhoNhatVFD1 !=
                              null
                          ? capPhatNhoNhat = 2
                          : capPhatNhoNhat = 1;

                      double vFD = double.parse(value);
                      double vREF = Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .saiSoNhoNhatVREF;
                      if ((100 * (vFD - vREF) / vREF).abs() <= kiemDinh) {
                        saiSoNhoNhat = true;
                      } else
                        saiSoNhoNhat = false;

                      if (saiSoLonNhat == true && saiSoNhoNhat == true) {
                        Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .doLuong32 = true;
                      } else
                        Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .doLuong32 = false;
                    });
                  } else {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .saiSoNhoNhatVFD2 = null;
                    setState(() {
                      capPhatNhoNhat--;
                    });
                  }
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: SwitchListTile(
                    title: Text(''),
                    subtitle: Text(
                      'Bạn có muốn hiệu chính',
                      style: TextStyle(fontSize: 12),
                    ),
                    value: hieuChinh,
                    onChanged: (value) {
                      setState(() {
                        hieuChinh = value;
                      });
                    }),
              ),
              !hieuChinh
                  ? SizedBox(
                      height: kDefaultPadding,
                    )
                  : Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Thể tích lớn nhất VFD',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .hieuChinhLonNhatVFD1 = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Thể tích lớn nhất VFD',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .hieuChinhLonNhatVFD2 = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          TextFieldUi(
                            label: 'Thể tích nhỏ nhất VFD',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .hieuChinhNhoNhatVFD1 = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Thể tích nhỏ nhất VFD',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .hieuChinhNhoNhatVFD2 = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                        ],
                      ),
                    ),

              SwitchListTile(
                  title: Text('7.3.3'),
                  subtitle: Text(
                    'Kiểm tra sai số tại lượng cấp phát tối thiểu Vmin',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .doLuong33,
                  onChanged: (value) {}),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              TextFieldUi(
                label: 'Lượng cấp phát tối thiểu VREF',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .luongCapPhatToiThieuVREF = double.parse(value);
                  } else
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .luongCapPhatToiThieuVREF = null;
                },
              ),
              SizedBox(height: kDefaultPadding / 2),
              TextFieldUi(
                label: 'Lượng cấp phát tối thiểu VFD',
                text: '20 L',
                press: (value) {
                  if (value != '') {
                    Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .luongCapPhatToiThieuVFD = double.parse(value);

                    setState(() {
                      double vREF = Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .luongCapPhatToiThieuVREF;
                      double vFD = double.parse(value);
                      if ((vFD - vREF).abs() < 0.01 * vREF) {
                        Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .doLuong33 = true;
                      } else
                        Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .doLuong33 = false;
                    });
                  }
                },
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('7.3.4'),
                  subtitle: Text(
                    'Kiểm tra sai số tại lượng cấp phát tối thiểu Vmin',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .doLuong34,
                  onChanged: (value) {}),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: SwitchListTile(
                    title: Text(''),
                    subtitle: Text(
                      'Kiểm tra bằng mắt',
                      style: TextStyle(fontSize: 12),
                    ),
                    value: Provider.of<Public>(context, listen: false)
                        .reportOTD
                        .kiemTraBangMat,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .kiemTraBangMat = value;

                        Provider.of<Public>(context, listen: false)
                            .reportOTD
                            .doLuong34 = value;
                      });
                    }),
              ),
              Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .kiemTraBangMat
                  ? SizedBox(
                      height: kDefaultPadding,
                    )
                  : Container(
                      child: Column(
                        children: [
                          TextFieldUi(
                            label: 'Thể tích lớn nhất VREF',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauTachKhiVREF = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Thể tích lớn nhất VFD',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauTachKhiVFD = double.parse(value);
                              }
                            },
                          ),
                          SwitchListTile(
                              title: Text('7.3.5'),
                              subtitle: Text(
                                'Kiểm tra cơ cấu đặt trước',
                                style: TextStyle(fontSize: 12),
                              ),
                              value: Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .doLuong35,
                              onChanged: (value) {}),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Đơn giá Pu',
                            text: '14970 đ',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .pU = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Thể tích đặt trước VPR',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauDatTruocVPF = double.parse(value);

                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauDatTruocVPF = double.parse(
                                        value) *
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .pU;
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Thể tích đo trên bình chuẩn VREF',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauDatTruocVREF = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Giá tiền thấy được PFD',
                            text: '377400 đ',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauDatTruocPFD = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Thể tích đo được VFD',
                            text: '20 L',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauDatTruocVFD = double.parse(value);

                                setState(() {
                                  double vFD = double.parse(value);
                                  double pFD = Provider.of<Public>(context,
                                          listen: false)
                                      .reportOTD
                                      .coCauDatTruocPFD;
                                  double pPR = Provider.of<Public>(context,
                                          listen: false)
                                      .reportOTD
                                      .coCauDatTruocPPR;
                                  double vREF = Provider.of<Public>(context,
                                          listen: false)
                                      .reportOTD
                                      .coCauDatTruocVREF;
                                  double vPF = Provider.of<Public>(context,
                                          listen: false)
                                      .reportOTD
                                      .coCauDatTruocVPF;
                                  if (pPR == pFD &&
                                      vFD == vPF &&
                                      (100 * (vFD - vREF) / vREF).abs() <
                                          kiemDinh) {
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .doLuong35 = true;
                                  } else
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .doLuong35 = false;
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          SwitchListTile(
                              title: Text('7.3.6'),
                              subtitle: Text(
                                'Kiểm tra cơ cấu tính tiền',
                                style: TextStyle(fontSize: 12),
                              ),
                              value: Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .doLuong36,
                              onChanged: (value) {}),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Thể tích đo được VFD',
                            text: '377400 đ',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauTinhTienVFD = double.parse(value);
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Giá tiền hiển thị PFD',
                            text: '94350 đ',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .coCauTinhTienPFD = double.parse(value);
                                double delTa;
                                if (double.parse(value) <= 10000) {
                                  delTa = 100;
                                } else if (double.parse(value) <= 20000) {
                                  delTa = 200;
                                } else
                                  delTa = 300;
                                double pC = Provider.of<Public>(context,
                                            listen: false)
                                        .reportOTD
                                        .pU *
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .coCauTinhTienVFD;
                                double eP = double.parse(value) - pC;
                                setState(() {
                                  if (eP < delTa) {
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .doLuong36 = true;
                                  } else
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .doLuong36 = false;
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          SwitchListTile(
                              title: Text('7.3.7'),
                              subtitle: Text(
                                'Kiểm tra độ giãn nở ống mềm',
                                style: TextStyle(fontSize: 12),
                              ),
                              value: Provider.of<Public>(context, listen: false)
                                  .reportOTD
                                  .doLuong37,
                              onChanged: (value) {}),
                          SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          TextFieldUi(
                            label: 'Số chỉ ống đong ',
                            text: '8 mL',
                            press: (value) {
                              if (value != '') {
                                Provider.of<Public>(context, listen: false)
                                    .reportOTD
                                    .soChiOngDong = double.parse(value);
                                setState(() {
                                  if (double.parse(value) <= 20) {
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .doLuong37 = true;
                                  } else
                                    Provider.of<Public>(context, listen: false)
                                        .reportOTD
                                        .doLuong37 = false;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
            ],
          )),
    );
  }
}

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: kDefaultPadding),
          child: Column(
            children: [
              SwitchListTile(
                  title: Text('8.1'),
                  subtitle: Text(
                    'Kiểm tra nội dung in',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .coCauIn1,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .coCauIn1 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding,
              ),
              SwitchListTile(
                  title: Text('8.2'),
                  subtitle: Text(
                    'Kiểm tra chức năng in',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: Provider.of<Public>(context, listen: false)
                      .reportOTD
                      .coCauIn2,
                  onChanged: (value) {
                    setState(() {
                      Provider.of<Public>(context, listen: false)
                          .reportOTD
                          .coCauIn2 = value;
                    });
                  }),
              SizedBox(
                height: kDefaultPadding * 3,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Public>(context, listen: false).setPageInit(0);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 2,
                      vertical: kDefaultPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            color: kColorOutSide.withOpacity(0.3))
                      ]),
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
