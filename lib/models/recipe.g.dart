// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as String,
      title: json['title'] as String,
      photo: json['photo'] as String,
      preparationTime: json['preparationTime'] as String,
      difficulty: json['difficulty'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      calories: json['calories'] as int,
      video: json['video'] as String,
      stepByStepVideo: json['stepByStepVideo'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'photo': instance.photo,
      'preparationTime': instance.preparationTime,
      'difficulty': instance.difficulty,
      'ingredients': instance.ingredients,
      'calories': instance.calories,
      'video': instance.video,
      'stepByStepVideo': instance.stepByStepVideo,
      'tags': instance.tags,
    };
