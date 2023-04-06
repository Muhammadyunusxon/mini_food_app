import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_food_app/domain/facade/auth_facade.dart';
import 'package:mini_food_app/domain/model/user_model.dart';
import 'package:mini_food_app/infastructura/servises/dio.dart';

class AuthRepo implements AuthFacade {
  @override
  Future<Either<UserModel, String>> login(String email) async {
    try {
      final res = await DioService.client().post("/api/v1/auth/login");

      return left(UserModel(firstname: res.data.toString()));
    } catch (e) {
      if (e is DioError) {
        if(e.response?.statusCode == 400){
          return right("Email xatto yoki password xatto");
        }else{
          return right(e.response?.statusCode.toString() ?? "something is wrong");
        }
      } else {
        return right(e.toString());
      }
    }
  }
}
