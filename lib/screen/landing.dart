import 'package:auth/screen/auth.dart';
import 'package:auth/screen/home.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLoggedin = false;

    return isLoggedin ? HomePage() : AuthorizatoinPage();
  }
}
