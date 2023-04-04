import 'package:flutter/material.dart';

import 'view/pages/main/main_page.dart';

abstract class AppRoute {
  AppRoute._();

  static goMain(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => MainPage()), (route) => false);
}
