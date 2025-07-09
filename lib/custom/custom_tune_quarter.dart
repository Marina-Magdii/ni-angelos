import 'package:flutter/material.dart';

class CustomTuneQuarter extends StatelessWidget {
  const CustomTuneQuarter({super.key});
  final bool showArabic = true;
  final bool showMoaarab = true;
  final bool showCoptic = true;
  static List<String> arabicText = [
    'هذا نص باللغة العربية ١',
    'هذا نص باللغة العربية ٢',
    'هذا نص باللغة العربية ٣',
  ];

  static List<String> englishText = [
    'English paragraph 1',
    'English paragraph 2',
    'English paragraph 3',
  ];

  static List<String> copticText = [
    'ⲡⲁⲣⲁⲅⲣⲁⲫⲟⲥ 1',
    'ⲡⲁⲣⲁⲅⲣⲁⲫⲟⲥ 2',
    'ⲡⲁⲣⲁⲅⲣⲁⲫⲟⲥ 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context,index){
          return Divider();
        },
          itemBuilder: (context,index){
            return Text(copticText[index]);
      }, itemCount: copticText.length,),
    );
  }
}
