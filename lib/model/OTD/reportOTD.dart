class ReportOTD {
  String nameCompany;
  String local;
  String phone;
  String email;
  String type;
  String soGiayChungNhan;
  String time;
  String dieuKienMoiTruong;
  String cheDoKiemDinh;
  String cheDoKiemDinhVien;
  String kiemDinhVien;
  String soSerial;
  String kieu;
  String kieuMay;
  String nuocSanXuat;
  String coSoSanXuat;
  String namSanXuat;
  String soTemKD;
  String nhieuLieu;
  bool checkOut11;
  bool checkOut12;
  bool checkOut13;
  bool checkOut14;
  bool checkOut15;
  bool checkOut16;
  bool nhanHieu;
  bool cacBoPhanChinh;
  bool kinhBaoVe;
  bool ongCaoSu;
  bool kyThuat21;
  bool kyThuat22;
  bool kyThuat23;
  bool kyThuat24;
  bool doLuong31;
  bool doLuong32;
  bool doLuong33;
  bool doLuong34;
  bool doLuong35;
  bool doLuong36;
  bool doLuong37;
  bool coCauIn1;
  bool coCauIn2;
  double luuLuongLonNhatDatDuocT;
  double luuLuongLonNhatDatDuocL;
  double saiSoLonNhatVREF;
  double saiSoLonNhatVFD1;
  double saiSoLonNhatVFD2;
  double saiSoNhoNhatVREF;
  double saiSoNhoNhatVFD1;
  double saiSoNhoNhatVFD2;
  double hieuChinhLonNhatVFD1;
  double hieuChinhLonNhatVFD2;
  double hieuChinhNhoNhatVFD1;
  double hieuChinhNhoNhatVFD2;
  double luongCapPhatToiThieuVFD;
  double luongCapPhatToiThieuVREF;
  bool kiemTraBangMat;
  double coCauTachKhiVREF;
  double coCauTachKhiVFD;
  double coCauDatTruocVFD;
  double coCauDatTruocVREF;
  double coCauDatTruocVPF;
  double pU;
  double coCauDatTruocPPR;
  double coCauDatTruocPFD;
  double coCauTinhTienVFD;
  double coCauTinhTienPFD;
  double soChiOngDong;
  ReportOTD() {
    kiemTraBangMat = false;
    checkOut11 = false;
    checkOut12 = false;
    checkOut13 = false;
    checkOut14 = false;
    checkOut15 = false;
    checkOut16 = false;
    nhanHieu = false;
    cacBoPhanChinh = false;
    kinhBaoVe = false;
    ongCaoSu = false;
    kyThuat21 = false;
    kyThuat22 = false;
    kyThuat23 = false;
    kyThuat24 = false;
    doLuong31 = false;
    doLuong32 = false;
    doLuong33 = false;
    doLuong34 = false;
    doLuong35 = false;
    doLuong36 = false;
    doLuong37 = false;
    coCauIn1 = false;
    coCauIn2 = false;
  }

  Map<String, dynamic> toJson() => {
        'nameCompany': '$nameCompany',
        'local': '$local',
        'phone': '$phone',
        'email': '$email',
        'type': '$type',
        'soGiayChungNhan': '$soGiayChungNhan',
        'time': '$time',
        'dieuKienMoiTruong': '$dieuKienMoiTruong',
        'cheDoKiemDinh': '$cheDoKiemDinh',
        'cheDoKiemDinhVien': '$cheDoKiemDinhVien',
        'kiemDinhVien': '$kiemDinhVien',
        'soSerial': '$soSerial',
        'kieu': '$kieu',
        'kieuMay': '$kieuMay',
        'nuocSanXuat': '$nuocSanXuat',
        'coSoSanXuat': '$coSoSanXuat',
        'namSanXuat': '$namSanXuat',
        'soTemKD': '$soTemKD',
        'nhieuLieu': '$nhieuLieu',
        'checkOut11': '$checkOut11',
        'checkOut12': '$checkOut12',
        'checkOut13': '$checkOut13',
        'checkOut14': '$checkOut14',
        'checkOut15': '$checkOut15',
        'checkOut16': '$checkOut16',
        'nhanHieu': '$nhanHieu',
        'cacBoPhanChinh': '$cacBoPhanChinh',
        'kinhBaoVe': '$kinhBaoVe',
        'ongCaoSu': '$ongCaoSu',
        'kyThuat21': '$kyThuat21',
        'kyThuat22': '$kyThuat22',
        'kyThuat23': '$kyThuat23',
        'kyThuat24': '$kyThuat24',
        'doLuong31': '$doLuong31',
        'doLuong32': '$doLuong32',
        'doLuong33': '$doLuong33',
        'doLuong34': '$doLuong34',
        'doLuong35': '$doLuong35',
        'doLuong36': '$doLuong36',
        'doLuong37': '$doLuong37',
        'coCauIn1': '$coCauIn1',
        'coCauIn2': '$coCauIn2',
        'luongLuonglonNhatDatDuocT': '$luuLuongLonNhatDatDuocT',
        'luongLuonglonNhatDatDuocL': '$luuLuongLonNhatDatDuocL',
        'saiSoLonNhatVREF': '$saiSoLonNhatVREF',
        'saiSoLonNhatVFD1': '$saiSoLonNhatVFD1',
        'saiSoLonNhatVFD2': '$saiSoLonNhatVFD2',
        'saiSoNhoNhatVREF': '$saiSoNhoNhatVREF',
        'saiSoNhoNhatVFD1': '$saiSoNhoNhatVFD1',
        'saiSoNhoNhatVFD2': '$saiSoNhoNhatVFD2',
        'hieuChinhLonNhatVFD1': '$hieuChinhLonNhatVFD1',
        'hieuChinhLonNhatVFD2': '$hieuChinhLonNhatVFD2',
        'hieuChinhNhoNhatVFD1': '$hieuChinhNhoNhatVFD1',
        'hieuChinhNhoNhatVFD2': '$hieuChinhNhoNhatVFD2',
        'luongCapPhatToiThieuVFD': '$luongCapPhatToiThieuVFD',
        'luongCapPhatToiThieuVREF': '$luongCapPhatToiThieuVREF',
        'kiemTraBangMat': '$kiemTraBangMat',
        'coCauTachKhiVREF': '$coCauTachKhiVREF',
        'coCauTachKhiVFD': '$coCauTachKhiVFD',
        'coCauDatTruocVFD': '$coCauDatTruocVFD',
        'coCauDatTruocVREF': '$coCauDatTruocVREF',
        'coCauDatTruocVPF': '$coCauDatTruocVPF',
        'pU': '$pU',
        'coCauDatTruocPPR': '$coCauDatTruocPPR',
        'coCauDatTruocPFD': '$coCauDatTruocPFD',
        'coCauTinhTienVFD': '$coCauTinhTienVFD',
        'coCauTinhTienPFD': '$coCauTinhTienPFD',
        'soChiOngDong': '$soChiOngDong',
      };
}
