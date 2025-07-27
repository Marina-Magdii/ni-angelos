import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';

class CustomTitleContainer extends StatefulWidget {
  const CustomTitleContainer({
    super.key,
    required this.title,
    required this.description,
    this.showCoptic = false,
  });
  final String title;
  final String description;
  final bool showCoptic;

  @override
  State<CustomTitleContainer> createState() => _CustomTitleContainerState();
}

class _CustomTitleContainerState extends State<CustomTitleContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0),
          child: Text(widget.title),
        ),
        InkWell(
          onTap: (){},
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 8.0),
            child: CustomContainer(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.216,
                height: MediaQuery.of(context).size.height*0.15,
                child: Text(
                  widget.description,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  textDirection: widget.showCoptic ? TextDirection.ltr : TextDirection.rtl,
                  style: TextStyle(
                    fontSize:14 ,
                    fontFamily: widget.showCoptic?StringsManager.copticFont:StringsManager.fontFamily
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  editQuarterText ()async{
    final controller = TextEditingController(text: "text");
    final result = await
     showDialog(
        context: context,
         builder: (context){
          return AlertDialog(
            title: Text("Edit text"),
          );
    });
  }
}
