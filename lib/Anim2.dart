import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'StaggerAnimation.dart';

class Anim2 extends StatefulWidget {

  @override
  State<Anim2> createState() => _Anim2State();
}

class _Anim2State extends State<Anim2> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this
      );
  }
  Future<void> _playAnimation() async{
    try{
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled{
      //code here
    }
  }
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
        appBar: AppBar(title: Text('Stuggered Anim'),backgroundColor: Colors.black,),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: ()=>{
            _playAnimation()  
          },
          child: Center(child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.6)
              ),
            ),
            // child: StaggerAnimation(
            //   controller:_controller
            // ),  
          )),
        ),
    );
  }
}