import 'package:cov_app_flutter/controller/provider/public.dart';
import 'package:cov_app_flutter/model/static/color.dart';
import 'package:cov_app_flutter/model/static/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavigatorBarState createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5),
      height: 70,
      decoration: BoxDecoration(color: kColorOutSide),
      child: GestureDetector(
        onTap: () {
          Provider.of<Public>(context, listen: false).getListRequest();
          Provider.of<Public>(context, listen: false).setPageInit(0);
        },
        child: ButtonBottom(
          icon: Icons.assignment_ind,
          text: 'Đăng ký yêu cầu',
        ),
      ),
    );
  }
}

class ButtonBottom extends StatelessWidget {
  final IconData icon;
  final String text;
  const ButtonBottom({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: 70,
      width: _width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: Colors.white,
          ),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 12))
        ],
      ),
    );
  }
}
