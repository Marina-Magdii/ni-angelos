import 'package:flutter/material.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class TeachersCheckView extends StatelessWidget {
  const TeachersCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarTitle: StringsManager.teachersCheck,
        withBackArrow: true,
        body: Column(
      children: [

      ],
    ));
  }
}
