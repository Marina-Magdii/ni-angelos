import 'package:flutter/material.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_red_container.dart';
import 'package:ni_angelos/models/tune_model.dart';

class CustomTuneContainer extends StatelessWidget {
  const CustomTuneContainer({super.key,required this.tuneModel,required this.number});
  final TuneModel tuneModel;
  final int number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.tuneDetails,arguments: tuneModel);
      },
      child: CustomContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(tuneModel.title,
                  style: Theme.of(context).textTheme.labelMedium,),
                  Text(tuneModel.date,
                  style: Theme.of(context).textTheme.titleSmall,),
                ],
              ),
              CustomRedContainer(
                  child: Text("$number",
                  style: Theme.of(context).textTheme.bodyLarge,))
            ],
          )),
    );
  }
}
