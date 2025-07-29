import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/routes_manager.dart';
import 'package:ni_angelos/features/users/data/models/users_model.dart';
import 'package:ni_angelos/models/teacher_model.dart';

class CustomChildContainer extends StatelessWidget {
  const CustomChildContainer({
    super.key,
    this.check = false,
    this.user,
    this.teacherModel,
    required this.isSelected,
    this.onCheck,
  });
  final User? user;
  final TeacherModel? teacherModel;
  final bool check;
  final void Function()? onCheck;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return user?.usersData.name != null
        ? CustomContainer(
          onTap: () {
            check == true
                ? () {}
                : Navigator.pushNamed(
                  context,
                  user != null
                      ? RoutesManager.childDetails
                      : RoutesManager.teacherDetails,
                  arguments: user ?? teacherModel,
                );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    user?.usersData.name ?? teacherModel?.name ?? "",
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    user?.usersData.academicYear ??
                        teacherModel?.childrenAge ??
                        "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              check
                  ? CustomContainer(
                    onTap: onCheck,
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
                  : user?.usersData.image != null
                  ? Image.network(user!.usersData.image!, width: 48.w)
                  : SvgPicture.asset(ImageAssets.boyImage, width: 48.w),
            ],
          ),
        )
        : SizedBox();
  }
}
