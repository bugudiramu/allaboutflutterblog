import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  List _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFF34495e),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int i) {
          return Dismissible(
            resizeDuration: Duration(milliseconds: 900),
            secondaryBackground: Container(
              color: Colors.green,
            ),
            key: Key(
              _todos[i].toString(),
            ),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (dir) {
              setState(() {
                _todos.removeAt(i);
              });
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Item ${i + 1} Is Deleted "),
                ),
              );
            },
            child: Card(
              color: Colors.white70,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => print("${_todos.length}"),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      _todos[i].toUpperCase(),
                    ),
                  ),
                  subtitle: Text("Wed, 17 Jul"),
                  leading: CircleAvatar(
                    backgroundColor: Color(0XFF34495e),
                    child: Text(
                      _todos[i][0].toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.trashAlt,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _todos.removeAt(i);
                      });
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Item ${i + 1} Is Deleted "),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Todo",
        child: Icon(FontAwesomeIcons.plus),
        backgroundColor: Color(0XFF34495e),
        onPressed: () => _showDialog(),
      ),
    );
  }

  _showDialog() {
    var alert = AlertDialog(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: ListTile(
        title: Container(
          child: Text(
            "Add Todo".toUpperCase(),
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        subtitle: Form(
          key: _key,
          autovalidate: true,
          child: TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter A Todo",
              alignLabelWithHint: true,
              icon: Icon(FontAwesomeIcons.drupal),
            ),
            validator: (val) {
              if (val.isEmpty) {
                return "Please Enter A Task";
              }
              return null;
            },
            onSaved: (val) {
              _controller.text = val;
            },
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            FlatButton(
              child: Text(
                "Cancel".toUpperCase(),
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text(
                "Add".toUpperCase(),
                style: TextStyle(
                  color: Color(0XCC27ae60),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                _validateForm();
              },
            ),
          ],
        )
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  _validateForm() {
    if (_key.currentState.validate()) {
      setState(() {
        _todos.add(_controller.text);
      });
      _controller.clear();
      Navigator.of(context).pop();
    }
  }
}
