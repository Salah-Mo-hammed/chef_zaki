import 'package:chef_zaki/core/error/failure.dart';
import 'package:chef_zaki/features/modules/data/sources/module_datasource.dart';
import 'package:chef_zaki/features/modules/domain/entities/recipe_entity.dart';
import 'package:chef_zaki/features/modules/domain/entities/recipe_request.dart';
import 'package:chef_zaki/features/modules/domain/repositories/recipe_repo.dart';
import 'package:dartz/dartz.dart';

class RecipeRepoImpl implements RecipeRepo{
  RecipeAiDataSource recipeAiDataSource;
  RecipeRepoImpl({required this.recipeAiDataSource});
  @override
  // Future<Either<Failure, RecipeEntity>> generateRecipe(RecipeRequest recipe_request) {
  //   // TODO: implement generateRecipe
  //   throw UnimplementedError();
  // }
  Future<String?> generateRecipe(RecipeRequest recipe_request) {
    return recipeAiDataSource.generateRecipe(recipeName: recipe_request.recipeType, country: recipe_request.country, ingredients: recipe_request.availableIngredients);
  }
}