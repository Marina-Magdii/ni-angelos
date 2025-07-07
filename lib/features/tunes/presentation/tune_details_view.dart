import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/models/tune_model.dart';

class TuneDetailsView extends StatelessWidget {
  const TuneDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as TuneModel;
    return SafeArea(
      child: MyCustomScaffold(
        appBarTitle:args.title ,
          actions: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: SvgPicture.asset(ImageAssets.arrowBack),
            )
          ],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              ],
            ),
          )),
    );
  }
}
