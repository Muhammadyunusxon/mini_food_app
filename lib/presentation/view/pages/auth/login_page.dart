import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Login Page",style: Theme.of(context).textTheme.labelMedium,),
          ),
        ],
      ),
    );
  }
}
