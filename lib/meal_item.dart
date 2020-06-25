import 'package:flutter/material.dart';
import 'package:mealsapp/meal_detail_screen.dart';
import './models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal _meal;

  MealItem(this._meal);

  String get complexityText {
    switch (_meal.complexity) {
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      default:
        return 'Unknown';
        break;
    }
    ;
  }

  String get affordabilityText {
    switch (_meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
    }
  }

  void selectMeal(BuildContext ctx, Meal meal) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return MealDetailScreen(meal);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         this.selectMeal(context, _meal);
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    _meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        width: 250,
                        color: Colors.black54,
                        child: Text(
                          _meal.title,
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ))),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text(_meal.duration.toString()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
