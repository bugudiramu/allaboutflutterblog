import 'package:flutter/material.dart';

class ValueChangeAnimation extends StatefulWidget {
  @override
  _ValueChangeAnimationState createState() => _ValueChangeAnimationState();
}

class _ValueChangeAnimationState extends State<ValueChangeAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation = IntTween(
      begin: 20,
      end: 0,
    ).animate(
      CurvedAnimation(curve: Curves.fastOutSlowIn, parent: animationController),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Center(
            child: Container(
              child: Text(
                "${animation.value.toString()}",
                style: TextStyle(
                    fontSize: 150.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
