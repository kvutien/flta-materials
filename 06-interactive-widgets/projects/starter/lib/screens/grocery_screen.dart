import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:provider/provider.dart';
import 'empty_grocery_screen.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

// Display grocery basket
class GroceryScreen extends StatelessWidget{
  const GroceryScreen({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO 4: Add a scaffold widget
    // return const EmptyGroceryScreen();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          // Present GroceryItemScreen
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                      onCreate: (item){
                        manager.addItem(item);
                        Navigator.pop(context);
                      },
                      onUpdate: (item){},
                  )
              )
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }
  // Add buildGroceryScreen
  Widget buildGroceryScreen(){
    return Consumer<GroceryManager>(
        builder: (context, manager, child){
          if(manager.groceryItems.isNotEmpty){
            // TODO 25: Add GroceryListScreen
            return GroceryListScreen(manager: manager);
          } else {
            return const EmptyGroceryScreen();
          }
        },
    );
  }
}