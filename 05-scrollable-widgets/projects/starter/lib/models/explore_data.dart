import 'models.dart';

// ExploreData is returned by an async call to getExploreData
class ExploreData {
  final List<ExploreRecipe> todayRecipes;
  final List<Post> friendPosts;
// constructor of the class
  ExploreData(
    this.todayRecipes,
    this.friendPosts,
  );
}
