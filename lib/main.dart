import 'package:flutter/material.dart';

import 'Screens/home_page_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Frost Beer",
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.orange[700]
      ),
      debugShowCheckedModeBanner: false,
      home: HomePageLogin(),
    );
  }
}
