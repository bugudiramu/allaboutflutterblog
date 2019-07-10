// Add http package to pubspec.yaml file
// All source code : https://github.com/bugudiramu/allaboutflutterblog
// import dart:async and dart:convert for doing asynchronous tasks and convertion/decoding the fetched json data.
// Here we are returning the future objects (what is Future Async and Await):
// Future is nothing but promise in Javascript. When we ask for something(like network request) it will give a promise that it will return the output data in future time at the time of doing that task we don't need to wait for the output data at that time we will do some other task where async and await comes into picture.
// SetState() is used to refresh the screen
// In the initState() we are calling the function which returns the data of the from the network.Here getData();
// Then in the body we are going to return the data with the help of ListView.


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HttpNetworking extends StatefulWidget {
  @override
  _HttpNetworkingState createState() => _HttpNetworkingState();
}

class _HttpNetworkingState extends State<HttpNetworking> {
  List posts = [];
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    setState(() {
      posts = json.decode(response.body);
    });
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Networking"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${posts[i]['id']}"),
                  ),
                  title: Text("${posts[i]['title']}"),
                  subtitle: Text("${posts[i]['body']}"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
