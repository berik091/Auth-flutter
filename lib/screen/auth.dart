import 'package:auth/domain/user.dart';
import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizatoinPage extends StatefulWidget {
  AuthorizatoinPage({Key key}) : super(key: key);

  @override
  _AuthorizatoinPageState createState() => _AuthorizatoinPageState();
}

class _AuthorizatoinPageState extends State<AuthorizatoinPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 150, bottom: 50),
        child: Container(
          child: Align(
            child: Text(
              'Itechno',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                    data: IconThemeData(color: Colors.white), child: icon),
              )),
        ),
      );
    }

    Widget __button(String text, void func()) {
      return RaisedButton(
        splashColor: Colors.blue[300],
        highlightColor: Colors.blue[300],
        color: Colors.white,
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue[900],
                fontSize: 20)),
        onPressed: () {
          func();
        },
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child:
                  _input(Icon(Icons.email), "Email", _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                top: 10,
              ),
              child: _input(
                  Icon(Icons.lock), "Password", _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 20,
              ),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: __button(label, func),
              ),
            )
          ],
        ),
      );
    }

    void _loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      User user = await _authService.signInWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Can`t SignIn you! Please check you email/password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _registerButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      User user = await _authService.registerWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Can`t Register you! Please check you email/password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return Container(
        child: Scaffold(
            backgroundColor: Colors.lightBlue[900],
            body: Column(
              children: <Widget>[
                _logo(),
                (showLogin
                    ? Column(
                        children: <Widget>[
                          _form('Login', _loginButtonAction),
                          Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: GestureDetector(
                              child: Text('No Registered? Register!',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              onTap: () {
                                setState(() {
                                  showLogin = false;
                                });
                              },
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          _form('Register', _registerButtonAction),
                          Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: GestureDetector(
                              child: Text('Already Registered? Login!',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              onTap: () {
                                setState(() {
                                  showLogin = true;
                                });
                              },
                            ),
                          )
                        ],
                      ))
              ],
            )));
  }
}
