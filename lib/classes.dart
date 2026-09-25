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
  TravelDeal(this.title, this.price, this.description, this.isPremium);
}