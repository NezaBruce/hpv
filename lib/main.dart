import 'dart:io';
import 'package:chtt/Anim2.dart';
import 'package:chtt/StaggerAnimation.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import './random_words.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.purple[900]),
    home:Container(
      child: RatingBar(
            ratingWidget: RatingWidget(
                full: Icon(Icons.star),
                empty: Icon(Icons.hourglass_empty),
                half: Icon(Icons.star_half_rounded)),
            onRatingUpdate: ((value) => print("object")),
            glowColor: Colors.amber[400],
            unratedColor: Colors.black87,
            ignoreGestures: false,
            glow: true,
          ),
    )
  );
 }
}
