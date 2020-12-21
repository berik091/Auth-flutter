import 'package:auth/screen/landing.dart';
import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
        child: MaterialApp(
            title: 'Max Fitness',
            theme: ThemeData(
                primaryColor: Color.fromRGBO(50, 65, 85, 1),
                textTheme: TextTheme(title: TextStyle(color: Colors.white))),
            home: LandingPage()
        ),
    );
  }
}
