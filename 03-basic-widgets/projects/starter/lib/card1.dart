import 'package:flutter/material.dart';

class Card1 extends StatelessWidget{
  const Card1({Key? key}): super(key: key);
  final String category = 'Editor\s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wanderlich';

  @override
  Widget build(BuildContext context){
    return Center(
      // TODO: Card1 Decorate Container
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
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
