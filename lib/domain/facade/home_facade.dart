import 'package:dartz/dartz.dart';
import 'package:mini_food_app/domain/model/retuarant_model.dart';

abstract class HomeFacade {
  Future<Either<Restaurants, String>> getRestaurants();
}
