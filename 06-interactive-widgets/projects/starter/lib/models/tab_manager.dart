import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selectedTab = 0;

  void goToTab(index){
    selectedTab = index;
    notifyListeners();
  }

  void gotoRecipes(){
    // the Recipe tab has index 1
    selectedTab = 1;
    notifyListeners();
  }
}