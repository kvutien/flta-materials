import 'package:flutter/material.dart';
import '../models/models.dart';
import 'components.dart';

// implement a ListView of posts from friends
class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;
  const FriendPostListView({
    Key? key,
    required this.friendPosts,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Social Chefs 👩‍🍳',
              style: Theme.of(context).textTheme.headline1,),
            const SizedBox(height: 16,),
            // ListView intermangling 2 kinds of widgets:
            //    (1)friends' posts and (2)separators
            ListView.separated(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (context, index){
                return const SizedBox(height: 16,);
              },
              itemCount: friendPosts.length,
            ),
            const SizedBox(height: 16,),
          ],
      ),
    );
  }
}