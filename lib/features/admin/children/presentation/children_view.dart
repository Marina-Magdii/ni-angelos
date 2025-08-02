import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ni_angelos/core/custom/custom_child_container.dart';
import 'package:ni_angelos/core/custom/custom_scaffold.dart';
import 'package:ni_angelos/core/custom/custom_search_container.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_bloc.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_event.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_state.dart';

class ChildrenView extends StatelessWidget {
  const ChildrenView({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersBloc bloc = GetIt.I.get<UsersBloc>()..add(UsersDataEvent());
    return BlocProvider(
      create: (context) => bloc,
      child: MyCustomScaffold(
        // app bar
        withBackArrow: true,
        leadingWidth: 70.w,
        appBarTitle: "${StringsManager.children} ",
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // add child icon
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_box_rounded, size: 25.sp),
            ),

            // excel icon
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(ImageAssets.excelIcon),
            ),
          ],
        ),

        body: SingleChildScrollView(
          // body
          child: Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
                // search field
                CustomSearchContainer(
                  onChanged: (value) {
                    bloc.add(UsersSearchEvent(value));
                  },
                ),

                // just space
                SizedBox(height: 20.h),

                // children list
                childrenList(bloc),
              ],
            ),
          ),
        ),
      ),
    );
  }

  childrenList(UsersBloc bloc) {
    return BlocBuilder<UsersBloc, UsersState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is UsersLoadingState) {
          return SizedBox(
            height: 500.h,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManager.secondaryColor,
              ),
            ),
          );
        } else if (state is UsersErrorState) {
          return SizedBox(
            height: 500.h,
              width: 250.w,
              child: Center(child: Text(state.errorMessage,textAlign: TextAlign.center,)));
        } else if (state is UsersSuccessState) {
          var users = state.filteredUsers;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 8.h);
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return CustomChildContainer(
                isSelected: state.selectedUsers.contains(users[index]),
                user: users[index],
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
