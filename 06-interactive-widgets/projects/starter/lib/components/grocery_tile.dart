import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget{
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GroceryTile({
    Key? key,
    required this.item,
    this.onComplete,
  }): textDecoration =
      item.isComplete ? TextDecoration.lineThrough: TextDecoration.none,
      super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 100,
      // Host all items of the grocery tile in this Row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Add a Column of (name, date, importance) to Row
          Row(
            children: [
              Container(width: 5.0, color: item.color,),
              SizedBox(width: 16.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  buildDate(),
                  const SizedBox(height: 4.0,),
                  buildImportance(),
                ],
              ),
            ],
          ),
          // Add a group (quantity, checkbox) to Row
          Row(
            children: [
              Text(item.quantity.toString(),
              style: GoogleFonts.lato(
                decoration: textDecoration,
                fontSize: 21,
              ),),
              buildCheckbox(),
            ],
          )
        ],
      ),
    );
  }
// Add BuildImportance()
  Widget buildImportance(){
    if(item.importance == Importance.low){
      return Text(
        'Low',
        style: GoogleFonts.lato(decoration: textDecoration),
      );
    } else if(item.importance == Importance.medium){
      return Text(
        'Medium',
        style: GoogleFonts.lato(
          decoration: textDecoration,
          fontWeight: FontWeight.w800,)
      );
    }else if(item.importance == Importance.high){
      return Text(
        'High',
        style: GoogleFonts.lato(
          decoration: textDecoration,
          fontWeight: FontWeight.w600,
        ),
      );
    }else {
      throw Exception(
          'This importance type (${item.importance}) doesn\'t exist'
      );
    }
  }

// Add buildDate()
  Widget buildDate(){
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration,),
    );
  }

// Add buildCheckbox()
  Widget buildCheckbox(){
    return Checkbox(
        value: item.isComplete,
        onChanged: onComplete,
    );
  }
}