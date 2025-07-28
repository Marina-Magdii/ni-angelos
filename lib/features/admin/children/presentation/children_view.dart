import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ni_angelos/core/custom/custom_child_container.dart';
import 'package:ni_angelos/core/custom/custom_scaffold.dart';
import 'package:ni_angelos/core/custom/custom_search_container.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_bloc.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_event.dart';
import 'package:ni_angelos/features/users/presentation/manager/users_state.dart';
import 'package:ni_angelos/models/child_model.dart';

class ChildrenView extends StatelessWidget {
  const ChildrenView({super.key});
  static ChildModel childModel = ChildModel(name: StringsManager.boyName,
      age:  StringsManager.primaryAge,);

  @override
  Widget build(BuildContext context) {
    final UsersBloc bloc = GetIt.I.get<UsersBloc>()..add(UsersDataEvent());
    return BlocProvider(
      create: (context){
        return bloc;
      },
      child: MyCustomScaffold(
        withBackArrow: true,
        appBarTitle: "${StringsManager.children} (225)",
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add_box_rounded,size: 25.sp,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.edit_rounded,size: 25.sp,)),
            SvgPicture.asset(ImageAssets.excelIcon),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomSearchContainer(),
                SizedBox(height: 20.h,),
                BlocBuilder<UsersBloc,UsersState>(
                  bloc: bloc,
                  builder: (context,state) {
                    if (state is UsersLoadingState){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if (state is UsersErrorState) {
                      return Column(
                        children: [
                          Center(
                            child: Text(state.errorMessage),
                          )
                        ],
                      );
                    }
                    else if (state is UsersSuccessState){
                      var users = state.users;
                      return ListView.separated(
                        separatorBuilder: (context,index){
                          return SizedBox(height: 8.h,);
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:users.length,
                        itemBuilder: (context, index) {
                          return CustomChildContainer(
                            user: users[index],
                          );
                        },
                      );
                    }
                return Container();
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
