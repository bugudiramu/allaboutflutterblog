import 'package:flutter/material.dart';

class SwipeToDismissEx extends StatefulWidget {
  @override
  _SwipeToDismissExState createState() => _SwipeToDismissExState();
}

class _SwipeToDismissExState extends State<SwipeToDismissEx> {
// Automatically generate a list of 50 items.
  List _items = List.generate(50, (i) => i + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// Showing the Material Drawer
      drawer: _showDrawer(),
      appBar: AppBar(
        title: Text("UI Elements"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
// Building the listview
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, int i) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
// Wrap the content in the Dismissible widget for swiping to dismiss.
              child: Dismissible(
// prividing a key which is the index of the items.
                key: Key(_items[i].toString()),
// background is used to show what will happen when the user dismisses the item in the background.Here we are showing a red color in the background of the card.
                background: Container(
                  color: Colors.redAccent,
                ),
// Here the item will be removed at the index of the item and refreshes the screen by using setState()
                onDismissed: (dir) {
                  setState(() {
                    _items.removeAt(i);
                  });
// Displaying the snackbar when the items is dismissed from the list.
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Item ${_items[i] - 1} is removed."),
                      backgroundColor: Colors.teal,
                    ),
                  );
                },
                resizeDuration: Duration(milliseconds: 800),
                child: Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${_items[i]}"),
                      ),
                      title: Text(
                        "ITEM NUMBER - ${_items[i]}",
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

// MaterialDrawer funtion.
  Widget _showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
// Used to show the name,useremail ,photo and the password in the header section.
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            accountEmail: Text("useremail@gmail.com"),
            accountName: Text("username"),
            currentAccountPicture: CircleAvatar(
              child: Text("U"),
            ),
          ),
// Shows the list items below the header.
          ListTile(
            title: Text("ITEM 1"),
            leading: Icon(Icons.inbox),
          ),
          ListTile(
            title: Text("ITEM 2"),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text("ITEM 3"),
            leading: Icon(Icons.pages),
          ),
        ],
      ),
    );
  }
}
