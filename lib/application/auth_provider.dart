import 'package:flutter/cupertino.dart';
import 'package:mini_food_app/domain/facade/auth_facade.dart';
import 'package:mini_food_app/infastructura/servises/app_helper.dart';
import 'package:mini_food_app/infastructura/servises/local_store.dart';
import 'package:web_socket_channel/io.dart';

class AuthProvider extends ChangeNotifier {
  final AuthFacade authRepo;
  bool isLoading = false;

  AuthProvider(this.authRepo);

  login(
      {required BuildContext context, required VoidCallback onSuccess}) async {
    isLoading = true;
    notifyListeners();
    final res = await authRepo.login("email");
    res.fold((data) {
      isLoading = false;
      notifyListeners();
      onSuccess();
      LocalStore.setToken(data.firstname);
    }, (error) {
      isLoading = false;
      notifyListeners();
      AppHelper.errorSnackBar(context: context,message: error);
    });
  }

  logOut({required VoidCallback onSuccess}) async {
    LocalStore.clear();
    onSuccess();
  }
}
