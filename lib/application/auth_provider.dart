import 'package:flutter/cupertino.dart';
import 'package:setup_provider/infastructura/servises/local_store.dart';

class AuthProvider extends ChangeNotifier{
  bool isLoading = false;


  login({required VoidCallback onSuccess}){
    isLoading = true;
    notifyListeners();
    // post login with repo
    Future.delayed(Duration(seconds: 2),(){
      isLoading = false;
      notifyListeners();
      onSuccess();
      LocalStore.setToken("value");
    });
  }


}