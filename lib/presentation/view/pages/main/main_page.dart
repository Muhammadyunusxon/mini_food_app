import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Main Page",style: Theme.of(context).textTheme.labelMedium,),
      ),
    );
  }
}
