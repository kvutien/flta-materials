import 'package:flutter/material.dart';
// import '../fooderlich_theme.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

// Implements the screen "Explore" that lists Recipes et friends' posts
// also simulates an async call to an API
class ExploreScreen extends StatelessWidget{
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    // Add FutureBuilder with data for TodayRecipeListView
    return FutureBuilder(
      // declare a future that will resolve as an ExploreData
      // the future is simulated by MockFooderlichService that waits 1 sec
      // before return a list of recipes and of posts
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
          // Add Nested List Views. this primary ListView nests 2 secon-
          //   -dary ListViews TodayRecipeListView & FriendPostListView
          if(snapshot.connectionState == ConnectionState.done){
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(
                  recipes: snapshot.data?.todayRecipes ?? []
                ),
                const SizedBox(height: 16,),
                FriendPostListView(
                    friendPosts: snapshot.data?.friendPosts ?? []
                ),
              ],
            );
          }
          else{return const Center(
            // if the future is not yet resolved, display a spinner
            child: CircularProgressIndicator(),
          );}
        },
    );
  }
}