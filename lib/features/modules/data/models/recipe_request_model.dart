import 'package:chef_zaki/features/modules/domain/entities/recipe_request.dart';

class RecipeRequestModel extends RecipeRequest {
  RecipeRequestModel({
    required super.recipeType,
    required super.country,
    required super.availableIngredients,
  });
  factory RecipeRequestModel.fromJson(Map<String, dynamic> json) {
    return RecipeRequestModel(
      recipeType: json['recipeType'] as String,
      country: json['country'] as String,
      availableIngredients: List<String>.from(
        json['availableIngredients'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipeType': recipeType,
      'country': country,
      'availableIngredients': availableIngredients,
    };
  }
}
