class RequestOTD {
  String time;
  String type;
  String name;
  String phone;
  String email;
  String soTru;
  String nameCompany;
  String local;
  bool check;
  String title;
  RequestOTD() {
    check = false;
  }
  Map<String, dynamic> toJson() => {
        'time': '$time',
        'type': '$type',
        'name': '$name',
        'phone': '$phone',
        'email': '$email',
        'nameCompany': '$nameCompany',
        'local': '$local',
        'soTru': '$soTru',
        'title': '$title',
        'check': '$check',
      };
}
