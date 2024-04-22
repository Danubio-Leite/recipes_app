import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/recipe.dart';

class RecipeService {
  final CollectionReference _recipeCollection =
      FirebaseFirestore.instance.collection('recipes');

  Future<List<Recipe>> getRecipes() async {
    QuerySnapshot snapshot = await _recipeCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        return Recipe.fromJson(data);
      } else {
        throw Exception('No data found for recipe ${doc.id}');
      }
    }).toList();
  }

  Future<Recipe> getRecipeById(String id) async {
    DocumentSnapshot snapshot = await _recipeCollection.doc(id).get();
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      return Recipe.fromJson(data);
    } else {
      throw Exception('No data found for recipe $id');
    }
  }

  Future<void> addRecipe(Recipe recipe) async {
    await _recipeCollection.add(recipe.toJson());
  }

  Future<void> updateRecipe(Recipe recipe) async {
    await _recipeCollection.doc(recipe.id).update(recipe.toJson());
  }

  Future<void> deleteRecipe(String id) async {
    await _recipeCollection.doc(id).delete();
  }
}
