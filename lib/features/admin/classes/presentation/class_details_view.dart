import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/features/child/child_home.dart';
import 'package:ni_angelos/models/class_model.dart';

class ClassDetailsView extends StatelessWidget {
  const ClassDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ClassModel;
    return MyCustomScaffold(
      withBackArrow: true,
      appBarTitle: args.age,
        body: Padding(
          padding: REdgeInsets.symmetric(vertical: 16.0),
          child: ChildHome(),
        ));
  }
}
