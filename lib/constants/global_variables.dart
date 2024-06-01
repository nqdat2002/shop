import 'package:flutter/material.dart';

String uri = 'https://shop-s67f.onrender.com';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const pressedColor = Color.fromRGBO(255, 153, 0, 0.4);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static String cloudName = 'dsg8jgnhy';
  static String uploadPreset = 's5ubup6v';

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHwBmPPflYRnlZYjJeKOgJ5w-4hxQeXMoMTg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhKupMol_7rY-cx45IjmxGlX1axx2CTmi3sA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNgFetOLEt1ErDsROtuO7TbfuMAlu_SbrqdQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnaXVfEE0WLc7WuosgGdjSR3NA9ZKxWJja8A&s',
    'https://res.cloudinary.com/ecomsilver/image/upload/w_1250,h_800,q_auto/CoachHouse/PageImages/CH_furniture_close_2023_.jpg',
  ];

  static const   List<String> productCategories = [
    'Table',
    'Chair',
    'Couch',
    'Desk',
    'Stool',
    'Dresser'
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Table',
      'image': 'assets/images/table.png',
    },
    {
      'title': 'Chair',
      'image': 'assets/images/chair.png',
    },
    {
      'title': 'Couch',
      'image': 'assets/images/couch.png',
    },
    {
      'title': 'Desk',
      'image': 'assets/images/desk.png',
    },
    {
      'title': 'Stool',
      'image': 'assets/images/stool.png',
    },
    {
      'title': 'Dresser',
      'image': 'assets/images/dresser.png',
    },
  ];

  static String dfaultG = 'a';

  static String dfaultA = 'a';
}