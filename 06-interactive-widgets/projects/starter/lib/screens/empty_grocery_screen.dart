import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget{
  const EmptyGroceryScreen({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    // TODO 3: Replace and add layout widgets
    return Padding(
      padding: EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.asset('assets/fooderlich_assets/empty_list.png'),
              ),
            ),
            Text(
              'No groceries',
              style: TextStyle(fontSize: 21),
            ),
            const SizedBox(height: 16,),
            const Text(
              'Shopping for ingredients?\n'
              'tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              child: Text('Browse Recipes'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.green,
              onPressed: (){
                // TODO 8: Go to Recipes Tab
                Provider.of<TabManager>(context, listen: false).gotoRecipes();
              },
            ),
          ],
        ),
      ),
    );
  }
}