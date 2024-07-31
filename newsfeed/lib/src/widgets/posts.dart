import 'package:flutter/material.dart';
import '../models/post_model.dart';

class Posts extends StatelessWidget {
  final List<PostModel> posts;

  Posts(this.posts);

  Widget build(context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, int index) {
        return buildPost(posts[index]);
      },
    );
  }

  Widget buildPost(PostModel post) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue.shade300,
          width: 2.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              post.title,
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Image.network('http://10.0.2.2:8000' + post.imageUrl),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Text(
              post.content,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text(
                  post.user,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}