import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/helper_functions.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_divider.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_tune_quarter.dart';
import 'package:ni_angelos/models/tune_container_model.dart';
import 'package:ni_angelos/models/tune_model.dart';

class TuneDetailsView extends StatefulWidget {
  const TuneDetailsView({super.key});
  static List<String> arabicText = [
    StringsManager.quarterArabic,
    'بشفاعات مبوق القيامة ميخائيـل رئيس السمائيين ، يا رب انعم لنا بمغفرة خطايانا',
    'بشفاعات السبعة رؤساء الملائكة والطغمات السمائيـة . يا رب انعم لنا بمغفرة خطايانا',
  ];

  static List<String> moaarabText = [
    'هيتين ني ابريسفيا انتى تي ثيؤطوكوس اثؤواب ماريا : ابتشويس اري اهموت نان : ام بيكو ايفول انتى نين نوفي',
    'هيتين ني إبريسفيا انتي بي صالبيستيس انتي أنسطاسيس ميخائيل إب أرخون إنا نيفيؤي : ابتشويس اري اهموت نان : ام بيكو ايفول انتى نين نوفي',
    'هيتين ني إبريسفيا انتي بي شاشف إن أرشي أنجيلوس نيم ني طغما ان ايبورانيون . إبتشويس اري اهموت نان امبي كو ايفول انتى نين نوفي',
  ];

  static List<String> copticText = [
    'Hiten ni`precbia `nte 50e`otokoc =e=0=v maria : Pu `ari`hmot nan : `mpixw `ebol `nte nennobi',
    'Hiten ni`precbva `nte picalpict3c `n5anactacic Mixa3l `parxwn `nnanif3ov`i : Pu `ari`hmot nan : `mpixw `ebol `nte nennobi',
    'Hiten ni`precbia `nte pi2a24 `narx3ajjeloc nem nitajma `nepovranion : Psoic ari `hmot nan `mpixw `ebol `nte nennobi',
  ];

  @override
  State<TuneDetailsView> createState() => _TuneDetailsViewState();
}

class _TuneDetailsViewState extends State<TuneDetailsView> {
  bool showArabic = true;
  bool showMoaarab = true;
  bool showCoptic = true;
  bool isPlaying = false;
  static List<TuneContainerModel> optionsList = [
    TuneContainerModel(
      title: StringsManager.recorder1,
      icon: SvgPicture.asset(ImageAssets.recordIcon),
      onTap: () {},
    ),
    TuneContainerModel(
      title: StringsManager.recorder2,
      icon: SvgPicture.asset(ImageAssets.recordIcon),
      onTap: () {},
    ),
    TuneContainerModel(
      title: StringsManager.share,
      icon: SvgPicture.asset(ImageAssets.shareIcon),
      onTap: () {},
    ),
    TuneContainerModel(
      title: StringsManager.pdf,
      icon: SvgPicture.asset(
        ImageAssets.documentIcon,
      ),
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as TuneModel;
    return Stack(
      children: [
        MyCustomScaffold(
          withBackArrow: true,
          appBarTitle: args.title,
          leading:
              isAdmin()
                  ? Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesManager.newTune);
                        },
                        child: SvgPicture.asset(
                          ImageAssets.addIcon,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      InkWell(
                        onTap: () {
                          deleteTune();
                        },
                        child: SvgPicture.asset(
                          ImageAssets.deleteIcon,
                          width: 24.w,
                          height: 24.w,
                        ),
                      ),
                      SizedBox(width: 4.w),

                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          ImageAssets.editIcon,
                          width: 22.w,
                          height: 22.h,
                        ),
                      ),
                    ],
                  )
                  : SizedBox.shrink(),
          body: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  options(),
                  Row(
                    children: [
                      toggleLanguage(),
                      Expanded(child: CustomDivider()),
                    ],
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showCoptic)
                          CustomTuneQuarter(
                            texts: TuneDetailsView.copticText,
                            isCoptic: true,
                          ),
                        if (showMoaarab)
                          CustomTuneQuarter(texts: TuneDetailsView.moaarabText),
                        if (showArabic)
                          CustomTuneQuarter(texts: TuneDetailsView.arabicText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        isAdmin()
            ? SizedBox.shrink()
            : Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: ColorManager.shadow,
                  color: ColorManager.containerColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r),
                  ),
                ),
                child: Padding(
                  padding: REdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Slider(
                          padding: REdgeInsets.all(0),
                          value: 40,
                          onChanged: (v) {},
                          min: 0,
                          max: 100,
                          activeColor: ColorManager.secondaryColor,
                          inactiveColor: ColorManager.inActiveColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "06:54",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "15:54",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(ImageAssets.backSecIcon),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 64.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPlaying = !isPlaying;
                                });
                              },
                              child:
                                  isPlaying
                                      ? Icon(
                                        Icons.play_arrow_rounded,
                                        color: ColorManager.secondaryColor,
                                        size: 35,
                                      )
                                      : Icon(
                                        Icons.pause,
                                        color: ColorManager.secondaryColor,
                                        size: 35,
                                      ),
                            ),
                          ),
                          SvgPicture.asset(ImageAssets.forwardSecIcon),
                        ],
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ),
      ],
    );
  }

  toggleLanguage() {
    return CustomContainer(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                showCoptic = !showCoptic;
              });
            },
            child: Row(
              children: [
                Text(StringsManager.inCoptic),
                showCoptic
                    ? Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: SvgPicture.asset(ImageAssets.darkCheckIcon),
                    )
                    : Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.circle_rounded,
                        color: ColorManager.secondaryColor,
                      ),
                    ),
                SizedBox(width: 6.w),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                showMoaarab = !showMoaarab;
              });
            },
            child: Row(
              children: [
                Text(StringsManager.m),
                showMoaarab
                    ? Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: SvgPicture.asset(ImageAssets.darkCheckIcon),
                    )
                    : Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.circle_rounded,
                        color: ColorManager.secondaryColor,
                      ),
                    ),
                SizedBox(width: 6.w),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                showArabic = !showArabic;
              });
            },
            child: Row(
              children: [
                Text(StringsManager.a),
                showArabic
                    ? Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: SvgPicture.asset(ImageAssets.darkCheckIcon),
                    )
                    : Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.circle_rounded,
                        color: ColorManager.secondaryColor,
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  options() {
    isAdmin() ? optionsList.length==4?
    optionsList.insert(0,
        TuneContainerModel(
          title: StringsManager.addNewAttachment,
          icon: Icon(Icons.file_copy_rounded,color: ColorManager.secondaryColor,),
          onTap: () {
            Navigator.pushNamed(context, RoutesManager.newFile);
          },))
        :null:null;
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        reverse: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: optionsList.length,
        itemBuilder: (context, index) {
          return CustomContainer(
            onTap: optionsList[index].onTap??(){},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(child: optionsList[index].icon),
                Text(optionsList[index].title),
              ],
            ),
          );
        },
      ),
    );
  }

  deleteTune() {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          alignment: Alignment.bottomCenter,
          backgroundColor: ColorManager.containerColor,
          title: Center(child: Text(StringsManager.deleteTune)),
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          actions: [
            CustomContainer(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  StringsManager.cancel,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            CustomContainer(
              color: ColorManager.redContainer,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  StringsManager.delete,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
