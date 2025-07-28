import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/routes_manager.dart';
import 'package:ni_angelos/features/users/data/models/users_model.dart';
import 'package:ni_angelos/models/teacher_model.dart';

class CustomChildContainer extends StatefulWidget {
  const CustomChildContainer({
    super.key,
    this.check = false,
    this.user,
    this.teacherModel,
    this.onCheck,
  });
  final User? user;
  final TeacherModel? teacherModel;
  final bool check;
  final void Function()? onCheck;

  @override
  State<CustomChildContainer> createState() => _CustomChildContainerState();
}

class _CustomChildContainerState extends State<CustomChildContainer> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return widget.user?.usersData.name != null
        ? CustomContainer(
          onTap: () {
            Navigator.pushNamed(
              context,
              widget.user != null
                  ? RoutesManager.childDetails
                  : RoutesManager.teacherDetails,
              arguments: widget.user ?? widget.teacherModel,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.user?.usersData.name ??
                        widget.teacherModel?.name ??
                        "",
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.user?.usersData.academicYear ??
                        widget.teacherModel?.childrenAge ??
                        "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              widget.check
                  ? CustomContainer(
                    onTap: () {
                      isSelected = !isSelected;
                      widget.onCheck;
                      setState(() {});
                    },
                    verticalPadding: 0,
                    horizontalPadding: 0,
                    child: Icon(
                      isSelected
                          ? Icons.check_box
                          : Icons.check_box_outline_blank_outlined,
                      size: 30.sp,
                      color: ColorManager.secondaryColor,
                    ),
                  )
                  : widget.user?.usersData.image != null
                  ? Image.network(widget.user!.usersData.image!, width: 48.w)
                  : SvgPicture.asset(ImageAssets.boyImage, width: 48.w),
            ],
          ),
        )
        : SizedBox();
  }
}
