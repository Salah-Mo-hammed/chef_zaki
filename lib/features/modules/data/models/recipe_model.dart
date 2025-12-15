import 'package:chef_zaki/features/modules/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  RecipeModel({
    required super.title,
    required super.steps,
    required super.ingredientsWithAmount,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      title: json['title'] as String,
      steps: List<String>.from(json['steps']),
      ingredientsWithAmount: Map<String, String>.from(
        json['ingredientsWithAmount'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'steps': steps,
      'ingredientsWithAmount': ingredientsWithAmount,
    };
  }
}
