import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';
class TabsScreen extends StatefulWidget {
  const   TabsScreen ({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState() ;}
}

 class _TabsScreenState extends State<TabsScreen>{
  int selectedIndex  = 0 ;
  void _selectedIndex(int index){
    setState(() {
      selectedIndex  = index ;

    });
  }


 List<Meal> _favouriteMeals =  [];
  void onToggleFavourites(Meal meal)  {
  final isexisting =  _favouriteMeals.contains(meal); 
   if(isexisting) {
    _favouriteMeals.remove(meal);
   }
   else{
    _favouriteMeals.add(meal);
   }

  }
 Widget activeScreen = Text('');
 
  Widget  build(context){
      String activeTabTitle = 'Categories';
  if (selectedIndex  == 1 ){
    setState(() {
    activeScreen = Meals(title: '', meals:_favouriteMeals , onToggleFavourite: onToggleFavourites,);
        activeTabTitle = 'Favourites';
    });
  }
  if (selectedIndex  == 0 ){
    setState(() {
    activeScreen = CategoriesScreen(onToggleFavourite: onToggleFavourites,);
      
    });
  }

    return Scaffold(
appBar: AppBar(
  title: Text(activeTabTitle , style: TextStyle(color:  Colors.white),),
),
body: activeScreen,
bottomNavigationBar :  BottomNavigationBar(onTap: _selectedIndex , 
currentIndex: selectedIndex,
items: [
  BottomNavigationBarItem(icon: Icon(Icons.category) , label: 'Categories' ),
  BottomNavigationBarItem(icon: Icon(Icons.star) , label:'Favourites' ),

],)  
    );
  }
 }