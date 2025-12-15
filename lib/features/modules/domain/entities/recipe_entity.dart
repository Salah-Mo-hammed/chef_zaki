// what we will get
class RecipeEntity {
  final String title;
  final List<String> steps;
  final Map<String, String> ingredientsWithAmount;

  RecipeEntity({
    required this.title,
    required this.steps,
    required this.ingredientsWithAmount,
  });
}
