import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/post_model.dart';
import 'widgets/posts.dart';

class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  List<PostModel> posts = [];

  void getPosts() async {
    try {
      Map<String, String> requestHeaders = {
        'Accept': 'application/json'
      };

      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/posts/get-posts'),
        headers: requestHeaders,
      );

      posts.clear();
      setState(() {
        for (var post in json.decode(response.body)['posts']) {
          posts.add(PostModel(post));
        }
      });
      print(posts);
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Feed'),
        ),
        body: Posts(posts),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Refresh Posts',
          child: Icon(Icons.refresh),
          onPressed: getPosts,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
