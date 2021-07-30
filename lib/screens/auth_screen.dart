import 'package:flutter/material.dart';

import '/models/app_constants.dart';

class AuthScreen extends StatelessWidget {
  static String id = 'login_signup_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Text('Login'),
                Text('signup'),
              ],
            ),
          ),
          body: Container(
            child: TabBarView(
              children: <Widget>[
                Login(),
                Signup(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('LOGIN'),
    );
  }
}

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('SIGNUP'),
    );
  }
}
