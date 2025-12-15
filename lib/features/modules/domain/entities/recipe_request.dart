// the request that will be sent to the model
class RecipeRequest {
  final String recipeType;
  final String country;
  final List<String> availableIngredients;

  RecipeRequest({
    required this.recipeType,
    required this.country,
    required this.availableIngredients,
  });
}
