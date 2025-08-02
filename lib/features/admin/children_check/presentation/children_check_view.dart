import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:ni_angelos/core/custom/custom_button.dart';
import 'package:ni_angelos/core/custom/custom_child_container.dart';
import 'package:ni_angelos/core/custom/custom_scaffold.dart';
import 'package:ni_angelos/core/custom/custom_search_container.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_bloc.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_event.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_state.dart';
import 'package:ni_angelos/models/teacher_model.dart';

class ChildrenCheckView extends StatelessWidget {
  const ChildrenCheckView({super.key});
  static TeacherModel teacherModel = TeacherModel(
    name: StringsManager.boyName,
    childrenAge: StringsManager.primaryAge,
  );

  @override
  Widget build(BuildContext context) {
    final UsersBloc bloc = GetIt.I.get<UsersBloc>()..add(UsersDataEvent());
    return BlocProvider(
      create: (_) => bloc,
      child: MyCustomScaffold(
        withBackArrow: true,
        appBarTitle: StringsManager.childrenCheck,
        body: Padding(
          padding: REdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomSearchContainer(
                  onChanged: (value) {
                    bloc.add(UsersSearchEvent(value));
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      bloc.add(UsersSelectAllEvent());
                    },
                    child: Text(
                      StringsManager.selectAll,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                BlocBuilder(
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
                          child: Center(child: Text(state.errorMessage,
                          textAlign: TextAlign.center,)));
                    } else if (state is UsersSuccessState) {
                      var users = state.users;
                      return ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 8.h);
                        },
                        physics: BouncingScrollPhysics(),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          final isSelected = state.selectedUsers.contains(user);

                          return CustomChildContainer(
                            onCheck: () {
                              bloc.add(UsersSelectEvent(user));
                            },
                            check: true,
                            user: user,
                            isSelected: isSelected,
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
                CustomButton(title: StringsManager.send, onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
