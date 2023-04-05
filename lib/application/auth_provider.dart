import 'package:flutter/cupertino.dart';
import 'package:setup_provider/domain/facade/auth_facade.dart';
import 'package:setup_provider/infastructura/servises/local_store.dart';
import 'package:web_socket_channel/io.dart';

class AuthProvider extends ChangeNotifier {
  final AuthFacade authRepo;
  bool isLoading = false;

  AuthProvider(this.authRepo);

  login({required VoidCallback onSuccess}) async {
    isLoading = true;
    notifyListeners();
    authRepo.login("email");
    Future.delayed(Duration(seconds: 2), () {
      isLoading = false;
      notifyListeners();
      onSuccess();
      LocalStore.setToken("value");
    });
  }

  logOut({required VoidCallback onSuccess}) async {
    LocalStore.clear();
    onSuccess();
  }
}
