import 'package:flutter/material.dart';

class ScreenSize {
  static late double constWidth;
  static late double constHeight;
  static void init(BuildContext context){
    Size size = MediaQuery.of(context).size;
    constWidth = size.width;
    constHeight = size.height;
  }
}

const Color kPrimaryColor=Colors.orange;