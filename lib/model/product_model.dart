import 'package:flutter/cupertino.dart';

class Product {

   final ImageProvider image;
   final String name;
   final String price;

   Product({required this.image,required this.name,required this.price,required this.color,this.onPressed});

  final color;
  void Function()? onPressed;
}