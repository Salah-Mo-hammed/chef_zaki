import 'package:chef_zaki/core/error/failure.dart';
import 'package:chef_zaki/features/modules/domain/entities/recipe_entity.dart';
import 'package:chef_zaki/features/modules/domain/entities/recipe_request.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeRepo {
  // Future<Either<Failure,RecipeEntity>> generateRecipe(RecipeRequest recipe_request);
  Future<String?> generateRecipe(RecipeRequest recipe_request);

}