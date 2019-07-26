import 'package:allaboutflutterblog/tuts/animations/login/signUp.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool hidePass = true;
  Animation animation, delayAnimation, muchDelayedAnimation;
  AnimationController animationController;

  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    );
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(curve: Curves.fastOutSlowIn, parent: animationController),
    );
    delayAnimation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  stops: [0.5, 0.8],
                  colors: [
                    Colors.cyanAccent,
                    Colors.tealAccent,
                  ],
                ),
              ),
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          animation.value * width, 0.0, 0.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        alignment: Alignment.center,
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB33771),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayAnimation.value * width, 0.0, 0.0),
                      child: Form(
                        key: _formKey,
                        autovalidate: true,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.alternate_email,
                                      color: Colors.blueGrey),
                                  hintText: "Email",
                                  labelStyle: TextStyle(
                                      // color: Colors.white,
                                      ),
                                  labelText: "Email"),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Please Provide Email";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _emailController.text = val;
                              },
                              autocorrect: true,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              // obscureText:hidepass we toggle when user clicks the icon
                              obscureText: hidePass,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.blueGrey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    },
                                  ),
                                  hintText: "Password",
                                  labelText: "Password"),
                              validator: (val) {
                                if (val.length < 6) {
                                  return "Passsword must contain atleast 6 characters";
                                } else if (val.isEmpty) {
                                  return "Password field can't be empty";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                _passwordController.text = val;
                              },
                              autocorrect: true,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            //  ================== Login Btn =======================
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0.0, 0.0),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0)),
                                minWidth: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  title: Center(
                                    child: Text(
                                      "Login",
                                      style: _btnStyle(),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  print("login btn clicked!");

                                  signIn();
                                },
                                color: Color(0xFFB33771),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0.0, 0.0),
                              child: Container(
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFFB33771),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Don't have an account!",
                                    style: TextStyle(
                                      color: Color(0xFFB33771),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => SignUp())),
                                    child: Text("SignUp",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 18.0)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  TextStyle _btnStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  signIn() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }
}
