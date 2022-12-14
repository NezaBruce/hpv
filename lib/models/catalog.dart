import 'package:flutter/material.dart';

class CatalogModel{
  static  List<String>  itemsNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];
   /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  /// 
  Item getById(int id)=> Item(id,itemsNames[id%itemsNames.length]); 

  Item getByPosition(int position) {
    return getById(position);
  }
}
@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price =42;

  Item(this.id,this.name)
        // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.

      : color = Colors.primaries[id%Colors.primaries.length];
    @override
    int get hashCode => id;

    @override    
    bool operator  == (Object other) => other is Item && other.id == id;
}