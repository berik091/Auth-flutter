import 'package:auth/domain/user.dart';
import 'package:auth/screen/auth.dart';
import 'package:auth/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedin = user !=null;

    return isLoggedin ? HomePage() : AuthorizatoinPage();
  }
}
