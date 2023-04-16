import 'package:flutter/material.dart';

class Photo {
  final String title;
  final String description;
  final String image;
  int likes;

  Photo(
      {required this.title,
      required this.description,
      required this.image,
      this.likes = 0});
}
