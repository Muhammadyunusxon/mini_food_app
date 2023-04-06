
import 'package:get_it/get_it.dart';
import 'package:mini_food_app/domain/facade/auth_facade.dart';
import 'package:mini_food_app/domain/facade/home_facade.dart';
import 'package:mini_food_app/infastructura/repo/auth_repo.dart';
import 'package:mini_food_app/infastructura/repo/home_repo.dart';

final getIt = GetIt.instance;


setUp(){
  getIt.registerSingleton<AuthFacade>(AuthRepo());
  getIt.registerSingleton<HomeFacade>(HomeRepo());
}

final authRepo = getIt.get<AuthFacade>();
final homeRepo = getIt.get<HomeFacade>();