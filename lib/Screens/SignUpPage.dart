import 'package:flutter/material.dart';
import 'package:flutter_page_router/flutter_page_router.dart';
import 'package:frost_beer/Screens/SignInPage.dart';
import 'package:frost_beer/repositorios/signInWithGoogle.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _adressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Cadastar",
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            highlightColor: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.slideParallaxDown,
                    duration: Duration(milliseconds: 700),
                    child: SignInPage(),
                  ));
            },
            child: Text(
              "Entrar",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[700]),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Card(
          elevation: 10,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              SizedBox(height: 13),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: "Nome de Usuário",
                    labelText: "Nome de usuário",
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.amber[600],
                    )),
                validator: (text) {
                  if (text.isEmpty) return "Nome Invalido!";
                },
              ),
              SizedBox(
                height: 13,
              ),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "bruce_wayne@hotmail.com",
                    fillColor: Colors.amberAccent,
                    labelText: "e-mail",
                    icon: Icon(
                      Icons.email,
                      color: Colors.amber[600],
                    )),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || !text.contains("@"))
                    return "Email Inválido!";
                },
              ),
              SizedBox(height: 13),
              TextFormField(
                controller: _passController,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Senha",
                    labelText: "senha",
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.amber[600],
                    )),
                obscureText: true,
                validator: (text) {
                  if (text.isEmpty || text.length < 6) return "Senha Inválida";
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _adressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: "Endereço",
                    labelText: "Endereço",
                    helperText: " ",
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.amber[600],
                    )),
                validator: (text) {
                  if (text.isEmpty) return "Endereço Invalido!";
                },
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                    /*model.signIn(
                                email: _emailController.text,
                                pass: _passController.text,
                                onSuccess: _onSuccess,
                                onFaill: _onFail,
                              );*/
                  },
                  color: Colors.orange[700],
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Cadastrar-se",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                         signInWithGoogle().whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.slideParallaxDown,
                          duration: Duration(milliseconds: 700),
                          child: SignInPage(),
                        ));
                  });
                  },
                  color: Colors.red[800],
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/google1.png"),
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Login com Google",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
