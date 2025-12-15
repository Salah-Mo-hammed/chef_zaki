import 'package:chef_zaki/features/modules/domain/entities/recipe_request.dart';

abstract class RecipeEvent {}
class generateRecipeEvent extends RecipeEvent{
  final RecipeRequest recipeRequest;
  generateRecipeEvent({required this.recipeRequest});
}