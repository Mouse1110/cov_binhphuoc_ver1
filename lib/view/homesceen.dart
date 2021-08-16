import 'package:cov_app_flutter/controller/provider/public.dart';
import 'package:cov_app_flutter/model/static/color.dart';

import 'package:cov_app_flutter/model/static/config.dart';
import 'package:cov_app_flutter/model/static/diaglog.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/bottom_navigation.dart';

class HomeSceen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kColorOutSide,
          title: Text(Config.titleAppBar[
              Provider.of<Public>(context, listen: true).pageInit]),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  DiaglogUI.showDialogFormRequest('Phiếu Yêu Cầu', context);
                }),
          ],
        ),
        drawer: DrawerUI(),
        bottomNavigationBar: BottomNavigatorBar(),
        body: Consumer<Public>(
          builder: (context, value, child) {
            return Config.widgetSceen[value.pageInit];
          },
        ));
  }
}

class DrawerUI extends StatefulWidget {
  const DrawerUI({
    Key key,
  }) : super(key: key);

  @override
  _DrawerUIState createState() => _DrawerUIState();
}

class _DrawerUIState extends State<DrawerUI> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: kColorOutSide,
            ),
            child: Text(
              'COV BÌNH PHƯỚC',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                DiaglogUI.showDialogConfig(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
