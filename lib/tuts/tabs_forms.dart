import 'package:flutter/material.dart';

class TabsForms extends StatefulWidget {
  @override
  _TabsFormsState createState() => _TabsFormsState();
}

class _TabsFormsState extends State<TabsForms> {
  // Global key holds the state of the form which is used to controll when submitting the form by checking validation
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController is used to control the text field
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Using DefaultTabController is the simplest option, since it creates a TabController and makes it available to all descendant widgets.
    // In Appbar use bottom and provide with the Tabs In the body section return the functionality of the tabs
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tabs and Forms Example"),
          backgroundColor: Colors.redAccent,
          // When a tab is selected, it needs to display content. You can create tabs using the TabBar widget.
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Image Tab"),
              ),
              Tab(
                child: Text("Form Tab"),
              ),
            ],
          ),
        ),
        // content for each tab
        body: TabBarView(
          children: <Widget>[
            // ListView helps us to scroll
            ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Image Example",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  // Dont forget to add the image path in pubspec.yaml file
                  child: FadeInImage.assetNetwork(
                    placeholder: 'images/giphy.gif',
                    image:
                        'https://mobile-di.com/wp-content/uploads/2018/08/flutter-review.jpeg',
                  ),
                ),
                Center(
                  child: Image.asset("images/img2.png"),
                ),
                Center(child: Text("Images are from unDraw."))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // The TextFormField widget renders a material design text field and can display validation errors when they occur.

                      TextFormField(
                        // input type should be email type
                        keyboardType: TextInputType.emailAddress,
                        // checking whether the textfield is empty or invalid input field we will provide a warning
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Please provide Email";
                          }
                          return "";
                        },
                        controller: _emailController,
                        // When typing is completed we assign the text in the input field to val which is further checks for the validation
                        onSaved: (val) {
                          _emailController.text = val;
                        },
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email",
                          labelText: "Email",
                        ),
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Please provide Password";
                          } else if (val.length < 6) {
                            return "Password must be greater than 6 characters";
                          }
                          return "";
                        },
                        // places dots instead of characters the lettes when we are typing
                        obscureText: true,
                        controller: _passwordController,
                        onSaved: (val) {
                          _passwordController.text = val;
                        },
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      ),
                      MaterialButton(
                        color: Colors.redAccent,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // checks the validation
                          _validateForm();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateForm() {
    // checks the current state of the form and validate it then we save the form and clears when submit button is pressed.
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _formKey.currentState.reset();
    }
  }
}
