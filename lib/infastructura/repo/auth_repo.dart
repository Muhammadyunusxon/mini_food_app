import 'package:setup_provider/domain/facade/auth_facade.dart';

class AuthRepo implements AuthFacade {
  @override
  login(String email) {
    print(email);
  }
}
