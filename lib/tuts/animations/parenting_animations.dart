import 'package:flutter/material.dart';

class ParentingAnimations extends StatefulWidget {
  @override
  _ParentingAnimationsState createState() => _ParentingAnimationsState();
}

class _ParentingAnimationsState extends State<ParentingAnimations>
    with SingleTickerProviderStateMixin {
  Animation parentAnimation, childAnimation, counterAnimation;
  AnimationController animationController;
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 4,
      ),
    );
    parentAnimation = Tween<double>(
      begin: -0.50,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: animationController,
      ),
    );
    // Delayed animation
    childAnimation = Tween<double>(
      begin: 2.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    counterAnimation = IntTween(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut,
      ),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Parenting Animations"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Transform(
                  transform: Matrix4.translationValues(
                    parentAnimation.value * width,
                    0.0,
                    0.0,
                  ),
                  child: Container(
                    color: Colors.redAccent,
                    height: childAnimation.value * 2,
                    width: childAnimation.value * 2,
                    child: Center(
                      child: Text(
                        "PARENT ANIMATION",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Text(
                    "${counterAnimation.value}",
                    style: TextStyle(
                      fontSize: 150.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
