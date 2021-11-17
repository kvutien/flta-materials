import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class Card1 extends StatelessWidget{
  const Card1({Key? key}): super(key: key);
  final String category = 'Editor\s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wanderlich';

  @override
  Widget build(BuildContext context){
    return Center(
      // Card1 Decorate Container
      child: Container(
        // Add a stack of text {category, title, description, chef}
        child: Stack(
          children: [
            Text(category,
            style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
                child: Text(title,
                  style: FooderlichTheme.darkTextTheme.headline2,
                ),
              top: 20,
            ),
            Positioned(
                child: Text(description,
                style: FooderlichTheme.darkTextTheme.bodyText1,
                ),
              bottom: 30,
              right: 0,
            ),
            Positioned(
                child: Text(chef,
                style: FooderlichTheme.darkTextTheme.bodyText1,
                ),
              bottom: 10,
              right: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        // Fill card1 with an image
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/mag1.png'),
          fit: BoxFit.cover
          ),
          borderRadius:BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
