import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/provider/public.dart';
import 'view/homesceen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Public>(
          create: (context) => Public(), child: HomeSceen()),
    );
  }
}
