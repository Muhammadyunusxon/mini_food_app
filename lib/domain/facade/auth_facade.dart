import 'package:dartz/dartz.dart';
import 'package:mini_food_app/domain/model/retuarant_model.dart';
import 'package:mini_food_app/domain/model/user_model.dart';

abstract class AuthFacade {

  Future<Either<UserModel,String>> login(String email);
  

}