import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/dishes.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.meal ,required this.onToggleFavourite });
  final Meal meal;
String get complexityText {
  return meal.complexity.name[0].toUpperCase() +meal.complexity.name.substring(1);
}

String get affordableText {
  return meal.affordability.name[0].toUpperCase() +meal.affordability.name.substring(1);
}
  void onSelectDishes( context  , Meal  meal,String title) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Dishes(meal: meal,title: title, onToggleFavourite: onToggleFavourite,))); 
  }
 final Function  onToggleFavourite;
 
   Widget build(context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap:(){
          onSelectDishes(context , meal , meal.title);
        } ,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.work,
                              label: '$complexityText'),
                        
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: '$affordableText'),
                        
                        
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
