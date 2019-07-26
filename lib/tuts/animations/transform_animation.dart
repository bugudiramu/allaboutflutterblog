import 'package:flutter/material.dart';

class TransformAnimation extends StatefulWidget {
  @override
  _TransformAnimationState createState() => _TransformAnimationState();
}

class _TransformAnimationState extends State<TransformAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation, transformAnimation;
  AnimationController animationController;
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );
    animation = Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(curve: Curves.fastOutSlowIn, parent: animationController),
    );
    // Delayed animation
    transformAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(200.0),
      end: BorderRadius.circular(20.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Center(
            child: Container(
              height: animation.value,
              width: animation.value,
              decoration: BoxDecoration(
                borderRadius: transformAnimation.value,
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text(
                  "TRANSFORM ANIMATION",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
