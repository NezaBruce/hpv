import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  // StaggerAnimation({Key key,this.controller}):
   StaggerAnimation({ Key? key, required this.controller }) :
    
    // Each animation defined here transforms its value during the subset
    // of the controller's duration defined by the animation's interval.
    // For example the opacity animation transforms its value during
    // the first 10% of the controller's duration.

  opacity  =  Tween<double>(
    begin: 0.0,
    end: 1.0
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.0,0.100,
        curve: Curves.ease
      ),
    ),
  ),
  // super(Key:key);
  super(key: key);
final AnimationController controller;
final Animation<double> opacity;
final Animation<double> width;
final Animation<double> height;
final Animation<EdgeInsets> padding;
final Animation<BorderRadius> borderRadius;
final Animation<Color> color;
  
  Widget _buildAnimation(BuildContext context,Widget? child){
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(
              color: Colors.indigo,
              width: 3.0
            ),
            borderRadius: borderRadius.value
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}