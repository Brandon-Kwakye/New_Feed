import 'package:flutter/material.dart';

class PostModel {
  late String title;
  late String imageUrl;
  late String user;
  late String content;

  PostModel(Map<String, dynamic> parsedJson) {
    title = parsedJson['title'];
    imageUrl = parsedJson['image'];
    user = parsedJson['user'];
    content = parsedJson['content'];
  }

  @override
  String toString() {
    return title;
  }
}
