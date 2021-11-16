import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}): super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  // set state variable
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    // Stateless Card1
    const Card1(),
    // Stateless Card2: author card
    const Card2(),
    // Stateless Card3: recipe card
    const Card3(),
  ];

  // set state function
  void onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Fooderlich',
        style: Theme.of(context).textTheme.headline6
        )
      ),
      // show selected page item
      body: pages[_selectedIndex],
      // show bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
        Theme.of(context).textSelectionTheme.selectionColor,
        // Set selected tab bar
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
          label: 'Card'
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Card2',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          )
        ],
      ),
    );
  }
}