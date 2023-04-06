import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_food_app/domain/facade/auth_facade.dart';
import 'package:mini_food_app/domain/model/retuarant_model.dart';
import 'package:mini_food_app/domain/model/user_model.dart';
import 'package:mini_food_app/infastructura/servises/dio.dart';

import '../../domain/facade/home_facade.dart';

class HomeRepo implements HomeFacade {
  @override
  Future<Either<Restaurants, String>> getRestaurants() async {
    try {
      final res = await DioService.client().get(
          "/api/v1/rest/shops/paginate?perPage=15&page=1&type=restaurant&lang=en");
      return left(Restaurants.fromJson(res.data));
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 400) {
          return right("Email xatto yoki password xatto");
        } else {
          return right(
              e.response?.statusCode.toString() ?? "something is wrong");
        }
      } else {
        return right(e.toString());
      }
    }
  }
}
