import 'package:flutter/material.dart';

class TuneContainerModel {
  String title;
  Widget icon;
  void Function()? onTap;
  TuneContainerModel({required this.title,required this.icon,required this.onTap});
}