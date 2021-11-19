import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../models/models.dart';
import '../components/components.dart';

// calls a simulated API to async call to get a recipe
// the future is simulated by MockFooderlichService that waits 1 sec
// before returning a list of recipes
class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();
  RecipesScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      // build a future that resolves in a snapshot, that is a list of recipes
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          // Add RecipesGridView Here
          return RecipesGridView(recipes: snapshot.data ?? [],);
        }else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}