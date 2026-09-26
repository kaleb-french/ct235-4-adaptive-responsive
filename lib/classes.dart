import 'package:flutter/material.dart';

class Destination{
  //f
  String name;
  IconData icon;
  //c
  Destination({
      required this.name,
      required this.icon}
      );
}
class TravelDeal{
  //f
  String title;
  double price;
  String description;
  bool isPremium;
  //c
  TravelDeal({
      required this.title,
      required this.price,
      required this.description,
      required this.isPremium});
}