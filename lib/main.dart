import 'package:flutter/material.dart';

import 'package:hypno_card/screens/home.dart';
import 'package:hypno_card/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hypno Card',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomeView(),
    );
  }
}
