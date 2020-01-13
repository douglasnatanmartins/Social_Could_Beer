import 'package:flutter/material.dart';
import 'package:flutter_page_router/flutter_page_router.dart';
import 'package:frost_beer/Screens/SignUpPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Entar", style: TextStyle(color: Colors.grey[700], 
        fontSize: 26,
        fontWeight: FontWeight.bold
        ),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            highlightColor: Colors.white,
            onPressed: (){
              Navigator.pushReplacement(context, PageTransition(
                type: PageTransitionType.rippleRightUp,
                duration: Duration(milliseconds: 700),
                child: SignUp(),
              ));

            },
            child: Text("Cadastrar",
            style: TextStyle(fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.orange[700]),),
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
              Text("Bem Vindo...!", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.orange[600]
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 13),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "bruce_wayne@hotmail.com",
                  fillColor: Colors.amberAccent,
                  labelText: "e-mail",
                  icon: Icon(Icons.email, color: Colors.amber[600],)
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  if(text.isEmpty || !text.contains("@"))
                  return "Email Inválido!";
                },
              ),
              SizedBox(height: 13),
              TextFormField(
                controller: _passController,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Senha",
                  labelText: "senha",
                  icon: Icon(Icons.vpn_key, color: Colors.amber[600],)
                ),
                obscureText: true,
                validator: (text){
                  if(text.isEmpty || text.length <6 )
                  return "Senha Inválida";
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: (){
                        if(_emailController.text.isEmpty)
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                    content: Text("Insira email para recuperação"),
                    backgroundColor: Colors.redAccent,
                    duration: Duration(seconds: 3),
                  ),
                );
                /*else{
                  model.recoveryPass(_emailController.text);
                  _scaffoldKey.currentState.showSnackBar(
                    Snackbar(content: Text("Confira seu Email"),
                    backgroundColor: Colors.amber[600],
                    duration: Duration( seconds: 3)
                    )
                  );
                }*/
                  },
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Text("Esqueci minha senha > ", style: TextStyle(color: Colors.orange[700],
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                  ),
                  ),
              ),
              ),
              SizedBox(height: 16,),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: (){
                      if(_formKey.currentState.validate()){


                      }
                      /*model.signIn(
                                email: _emailController.text,
                                pass: _passController.text,
                                onSuccess: _onSuccess,
                                onFaill: _onFail,
                              );*/
                  },
                  color: Colors.orange[700],
                  padding: EdgeInsets.all(15),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text("Entrar", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),)),)
              ],
        ),
      ),
      ),
    );
  }
}