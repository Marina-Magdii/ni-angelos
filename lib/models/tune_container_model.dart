import 'package:flutter_svg/flutter_svg.dart';

class TuneContainerModel {
  String title;
  SvgPicture icon;
  Function onTap;
  TuneContainerModel({required this.title,required this.icon,required this.onTap});
}