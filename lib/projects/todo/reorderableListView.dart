import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReorderableListVieww extends StatefulWidget {
  @override
  _ReorderableListViewwState createState() => _ReorderableListViewwState();
}

class _ReorderableListViewwState extends State<ReorderableListVieww> {
  List _todos = [];
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        centerTitle: true,
        backgroundColor: Color(0XFF34495e),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          try {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            setState(() {
              final element = _todos.removeAt(oldIndex);
              _todos.insert(newIndex, element);
            });
          } catch (e) {
            print(e.toString());
          }
        },
        children: <Widget>[
          for (final todo in _todos)
            Dismissible(
              key: ValueKey(todo),
              resizeDuration: Duration(milliseconds: 900),
              secondaryBackground: Container(
                color: Colors.green,
              ),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (dir) {
                final todoKey = int.tryParse(todo);
                if (todoKey != null) {
                  setState(() {
                    _todos.removeAt(todoKey-1);
                  });
                }

                // Scaffold.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text("Item ${todo + 1} Is Deleted "),
                //   ),
                // );
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
                        todo.toUpperCase(),
                      ),
                    ),
                    subtitle: Text("Wed, 17 Jul"),
                    leading: CircleAvatar(
                      backgroundColor: Color(0XFF34495e),
                      child: Text(
                        todo[0].toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    // trailing: IconButton(
                    //   icon: Icon(
                    //     FontAwesomeIcons.trashAlt,
                    //     color: Colors.redAccent,
                    //   ),
                    //   onPressed: () {
                    //     setState(() {
                    //       _todos.removeAt(todo);
                    //     });
                    //     Scaffold.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text("Item ${todo + 1} Is Deleted "),
                    //       ),
                    //     );
                    //   },
                    // ),
                  ),
                ),
              ),
            ),
        ],
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
