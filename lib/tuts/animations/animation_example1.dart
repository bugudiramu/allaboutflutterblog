import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardAnimation extends StatefulWidget {
  @override
  _CardAnimationState createState() => _CardAnimationState();
}

class _CardAnimationState extends State<CardAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: -0.15).animate(
        CurvedAnimation(curve: Curves.easeIn, parent: animationController));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Example"),
      ),
      body: Stack(
        children: <Widget>[
          new Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: 350.0,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Buy'),
                      elevation: 7.0,
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {}),
                  SizedBox(width: 10.0),
                  RaisedButton(
                      child: Text('Details'),
                      elevation: 7.0,
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {})
                ],
              ),
            ),
          ),
          new Center(
              child: GestureDetector(
            child: Container(
              alignment: Alignment.bottomCenter,
              width: 350.0,
              height: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: AssetImage('images/c7.jpg'), fit: BoxFit.cover)),
              transform:
                  Matrix4.translationValues(0.0, animation.value * width, 0.0),
            ),
            onTap: () {
              animationController.forward();
            },
            onDoubleTap: () {
              animationController.reverse();
            },
          ))
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   Animation animation;
//   AnimationController animationController;

//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(duration: Duration(milliseconds: 500), vsync: this);

//     animation = Tween(begin: 0.0, end: -0.15).animate(
//         CurvedAnimation(parent: animationController, curve: Curves.ease));
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return AnimatedBuilder(
//         animation: animationController,
//         builder: (BuildContext context, Widget child) {
//           return new Scaffold(
//               body: new Center(
//             child: new Stack(
//               children: <Widget>[
//                 new Center(
//                   child: Container(
//                     padding: EdgeInsets.all(10.0),
//                     width: 350.0,
//                     height: 200.0,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0)),
//                     child: new Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         RaisedButton(
//                             child: Text('Buy'),
//                             elevation: 7.0,
//                             color: Colors.blue,
//                             textColor: Colors.white,
//                             onPressed: () {}),
//                         SizedBox(width: 10.0),
//                         RaisedButton(
//                             child: Text('Details'),
//                             elevation: 7.0,
//                             color: Colors.blue,
//                             textColor: Colors.white,
//                             onPressed: () {})
//                       ],
//                     ),
//                   ),
//                 ),
//                 new Center(
//                     child: GestureDetector(
//                   child: Container(
//                     alignment: Alignment.bottomCenter,
//                     width: 350.0,
//                     height: 200.0,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         image: DecorationImage(
//                             image: AssetImage('images/c7.jpg'),
//                             fit: BoxFit.cover)),
//                     transform: Matrix4.translationValues(
//                         0.0, animation.value * width, 0.0),
//                   ),
//                   onTap: () {
//                     animationController.forward();
//                   },
//                   onDoubleTap: () {
//                     animationController.reverse();
//                   },
//                 ))
//               ],
//             ),
//           ));
//         });
//   }
// }
