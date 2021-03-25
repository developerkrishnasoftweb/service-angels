import 'package:flutter/material.dart';

class ProfessionCardInfo {
  final String name;
  final ImageProvider image;

  ProfessionCardInfo({this.name, this.image});

  factory ProfessionCardInfo.asset(String image, {String name}){
    return ProfessionCardInfo(image: AssetImage(image), name: name);
  }

  factory ProfessionCardInfo.network(String image, {String name}){
    return ProfessionCardInfo(image: NetworkImage(image), name: name);
  }
}