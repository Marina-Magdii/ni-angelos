import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_red_container.dart';
import 'package:ni_angelos/models/tune_model.dart';

class CustomTuneContainer extends StatelessWidget {
  const CustomTuneContainer({
    super.key,
    required this.tuneModel,
    required this.number,
    this.teacher = false,
    required this.screenName,
  });
  final TuneModel tuneModel;
  final int number;
  final bool teacher;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screenName, arguments: tuneModel);
      },
      child: CustomContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            teacher?IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_forever_rounded,size: 25.sp,),
            ):SizedBox(),
            Spacer(),
            Padding(
              padding: REdgeInsets.only(bottom: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    tuneModel.title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    children: [
                      teacher
                          ? Row(
                            children: [
                              Text(
                                tuneModel.teacher!,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8,
                                  top: 5,
                                ),
                                child: Icon(
                                  Icons.circle_rounded,
                                  size: 5.sp,
                                  color: ColorManager.titleSmall,
                                ),
                              ),
                            ],
                          )
                          : SizedBox.shrink(),
                      Text(
                        tuneModel.date,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomRedContainer(
              child: Text(
                "$number",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
