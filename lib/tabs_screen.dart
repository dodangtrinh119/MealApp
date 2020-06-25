import 'package:flutter/material.dart';
import 'package:mealsapp/categories_screen.dart';
import 'package:mealsapp/favorites_screen.dart';
import './main_drawer.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _page = [CategoriesScreen(), FavoritesScreen()];

  void selectPage(int index) {
      setState(() {
        _selectedPageIndex = index;
      });
  }

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: _page[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor, icon: Icon(Icons.category), title: Text('Category')),
          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor, icon: Icon(Icons.star), title: Text('Favorites'))
        ],
      ),
    );
  }
}
