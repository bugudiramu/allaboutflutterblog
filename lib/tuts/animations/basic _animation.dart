import 'package:flutter/material.dart';

class BasicAnimations extends StatefulWidget {
  @override
  _BasicAnimationsState createState() => _BasicAnimationsState();
}

class _BasicAnimationsState extends State<BasicAnimations>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );
    animation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: animationController,
      ),
    );
    // Delayed animation
    delayedAnimation = Tween<double>(
      begin: -0.2,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.6,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Animations"),
            centerTitle: true,
            backgroundColor: Colors.redAccent,
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Container(
                      color: Colors.red,
                      width: 200.0,
                      height: 200.0,
                      child: Center(
                        child: Text(
                          "BASIC ANIMATION",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Transform(
                    transform: Matrix4.translationValues(
                        0.0, animation.value * height, 0.0),
                    child: Container(
                      color: Colors.green,
                      width: 200.0,
                      height: 200.0,
                      child: Center(
                        child: Text(
                          "BASIC ANIMATION",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Transform(
                    transform: Matrix4.translationValues(
                        delayedAnimation.value * width, 0.0, 0.0),
                    child: AnimatedBuilder(
                      animation: delayedAnimation,
                      builder: (BuildContext context, Widget child) {
                        return Container(
                          color: Colors.purple,
                          width: 200,
                          height: 200.0,
                          child: Center(
                            child: Text(
                              "DELAYED ANIMATION",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
