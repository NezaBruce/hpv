import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StaggerAnimation extends StatelessWidget {
  // StaggerAnimation({Key key,this.controller}):
   StaggerAnimation({ super.key, required this.controller }) :
    
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
      curve: const Interval(
        0.0,0.100,
        curve: Curves.ease
      ),
    ),
  ),
  width = Tween<double>(
    begin: 50.0,
    end: 150.0
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.125,
        0.250,
        curve: Curves.ease
      )
    )
  ),
  height = Tween<double>(
    begin: 50.0,
    end: 150.0
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.250,
        0.350,
        curve: Curves.ease
      )
    )
  ),
  padding = EdgeInsetsTween(
    begin: EdgeInsets.only(bottom: 16.0),
    end: EdgeInsets.only(bottom: 75.0)
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.250,
        0.375,
        curve: Curves.ease
      )
    )
  ),  
  borderRadius= BorderRadiusTween(
    begin: BorderRadius.circular(4.0),
    end: BorderRadius.circular(75.0),
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.375,
        0.500,
        curve: Curves.ease
      ),
    ),
  ),
  color = ColorTween(
    begin: Color.fromARGB(255, 89, 105, 195),
    end: Colors.orange
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.500,
        0.750,
        curve: Curves.ease
      )
    )
  );
  
final AnimationController controller;
final Animation<double> opacity;
final Animation<double> width;
final Animation<double> height;
final Animation<EdgeInsets> padding;
final Animation<BorderRadius?> borderRadius;
final Animation<Color?> color;
  
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
class StaggerDome extends StatefulWidget{
const StaggerDome({super.key});
@override
State<StaggerDome> createState() => _StaggerDomeState();
}
class _StaggerDomeState extends State<StaggerDome> with TickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 5), vsync: this);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  Future<void> _playAnimation() async{
    try{
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    }on TickerCanceled{
      //some code here
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    timeDilation  = 10.0; 
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerard Pique"),
        backgroundColor: Colors.black38
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          _playAnimation();
        },
        child: Center(
          child: (
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.black87.withOpacity(0.1),
                border: Border
                .all(
                  color: Colors.black.withOpacity(0.5)
                )
              ),
              child: StaggerAnimation(controller: _controller),
            )
          ),
        ),
      ),
    );
  }
}