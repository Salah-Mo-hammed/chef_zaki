import 'package:chef_zaki/features/modules/domain/entities/recipe_entity.dart';

abstract class RecipeState {}
class RecipeStateInitial extends RecipeState{}
class RecipeStateLoading extends RecipeState{}
class RecipeStateSuccess extends RecipeState{
   String recipe;
  // ! for now it will be just string
  // RecipeEntity recipeEntity;
  RecipeStateSuccess({required this.recipe});
}

class RecipeStateError extends RecipeState{
  String errorMessage;
  RecipeStateError({required this.errorMessage});
}

