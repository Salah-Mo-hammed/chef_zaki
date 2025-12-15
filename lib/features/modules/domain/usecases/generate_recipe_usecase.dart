import 'package:chef_zaki/core/error/failure.dart';
import 'package:chef_zaki/features/modules/domain/entities/recipe_entity.dart';
import 'package:chef_zaki/features/modules/domain/entities/recipe_request.dart';
import 'package:chef_zaki/features/modules/domain/repositories/recipe_repo.dart';
import 'package:dartz/dartz.dart';

class GenerateRecipeUsecase {
  RecipeRepo recipeRepo;
  GenerateRecipeUsecase({required this.recipeRepo});

  // Future<Either<Failure,RecipeEntity>> call(RecipeRequest recipe_request){
  //   return recipeRepo.generateRecipe(recipe_request);
  // }
   Future<String?> call(RecipeRequest recipe_request){
    return recipeRepo.generateRecipe(recipe_request);
  }
}