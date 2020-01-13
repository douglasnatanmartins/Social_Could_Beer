import 'package:flutter/material.dart';
import 'package:flutter_page_router/flutter_page_router.dart';
import 'package:frost_beer/Screens/SignUpPage.dart';
import 'SignInPage.dart';

class HomePageLogin extends StatefulWidget {
  @override
  _HomePageLoginState createState() => _HomePageLoginState();
}

class _HomePageLoginState extends State<HomePageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Image.asset("images/login1.png"),
          SizedBox(
            height: 25,
          ),
          Text(
            "Social Cold Beer",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.orange[500],
            ),
          ),
          SizedBox(height: 15),
          ButtonTheme(
            height: 45,
            child: RaisedButton(
              color: Colors.orange[700],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.rippleLeftDown,
                      duration: Duration(milliseconds: 1400),
                      child: SignInPage(),
                    ));
              },
              child: Text(
                "Entrar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(height: 10),
          ButtonTheme(
            height: 45,
            child: RaisedButton(
              color: Colors.orange[700],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.rippleRightDown,
                      duration: Duration(milliseconds: 1500),
                      child: SignUp(),
                    ));
              },
              child: Text(
                "Cadastrar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
