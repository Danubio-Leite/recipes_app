import '../models/recipe.dart';
import '../services/recipe_service.dart';

class RecipeController {
  final RecipeService _recipeService;

  RecipeController(this._recipeService);

  Future<List<Recipe>> fetchRecipes() async {
    return await _recipeService.getRecipes();
  }

  Future<Recipe> fetchRecipeById(String id) async {
    return await _recipeService.getRecipeById(id);
  }

  Future<void> addRecipe(Recipe recipe) async {
    await _recipeService.addRecipe(recipe);
  }

  Future<void> updateRecipe(Recipe recipe) async {
    await _recipeService.updateRecipe(recipe);
  }

  Future<void> deleteRecipe(String id) async {
    await _recipeService.deleteRecipe(id);
  }
}
