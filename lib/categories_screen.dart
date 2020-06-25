import 'package:flutter/material.dart';
import './category_item.dart';

import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((element) {
          return CategoryItem(element);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
  }
}
