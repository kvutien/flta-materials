import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget{
  final GroceryManager manager;

  const GroceryListScreen({
    Key? key,
    required this.manager,
  }): super(key: key);

  @override
  Widget build(BuildContext context){
    // build a separated ListView of grocery items
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index){
          final item = groceryItems[index];
          // Dismissible wraps an InkWell that wraps a GroceryTile
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child:
                const Icon(
                  Icons.delete_forever, color: Colors.white,size: 50.0,
                ),
            ),
            onDismissed: (direction){
              manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item ${item.name} dismissed'),)
              );
            },
            child: InkWell(
              child: GroceryTile(
                item: item,
                key: Key(item.id),
                onComplete: (change){
                  if(change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryItemScreen(
                        originalItem: item,
                        onUpdate: (item){
                          manager.updateItem(index, item);
                          Navigator.pop(context);
                        },
                        onCreate: (item){},
                      ),
                    ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index){
            return const SizedBox(height: 16.0,);
        },
      ),
    );
  }
}