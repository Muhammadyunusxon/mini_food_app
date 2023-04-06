import 'package:flutter/cupertino.dart';
import 'package:mini_food_app/infastructura/servises/local_store.dart';

class AppProvider extends ChangeNotifier {
  bool isLightTheme = true;

  change() {
    isLightTheme = !isLightTheme;
    notifyListeners();
    LocalStore.setTheme(isLightTheme);
  }

  setTheme() async {
    await LocalStore.init();
    isLightTheme =  LocalStore.getTheme();
    notifyListeners();
  }
}
