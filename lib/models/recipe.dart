import 'package:json_annotation/json_annotation.dart';

import 'ingredient.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final String id;
  final String title;
  final String photo;
  final String preparationTime;
  final String difficulty;
  final List<Ingredient> ingredients;
  final int calories;
  final String video;
  final String stepByStepVideo;
  final List<String> tags;

  Recipe({
    required this.id,
    required this.title,
    required this.photo,
    required this.preparationTime,
    required this.difficulty,
    required this.ingredients,
    required this.calories,
    required this.video,
    required this.stepByStepVideo,
    required this.tags,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
