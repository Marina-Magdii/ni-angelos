import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
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
    'بشفاعات والدة الإله القديسة مريم ، يارب انعم لنا بمغفرة خطايانا',
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
  static List<TuneContainerModel> options = [
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
      icon: SvgPicture.asset(ImageAssets.pdfIcon),
      onTap: () {},
    ),
  ];

  @override
  State<TuneDetailsView> createState() => _TuneDetailsViewState();
}

class _TuneDetailsViewState extends State<TuneDetailsView> {
  bool showArabic = true;
  bool showMoaarab = true;
  bool showCoptic = true;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as TuneModel;
    return Stack(
      children: [
        SafeArea(
          child: MyCustomScaffold(
            appBarTitle: args.title,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: REdgeInsets.only(top: 10.0),
                  child: SvgPicture.asset(
                    ImageAssets.arrowBack,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
            ],
            body: SingleChildScrollView(
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
                    padding: REdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        if (showCoptic)
                          CustomTuneQuarter(
                            texts: TuneDetailsView.copticText,
                            isCoptic: true,
                          ),
                        Divider(),
                        if (showMoaarab)
                          CustomTuneQuarter(texts: TuneDetailsView.moaarabText),
                        Divider(),
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
        Positioned(
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
                        padding: REdgeInsets.symmetric(
                            horizontal: 32.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPlaying = !isPlaying;
                            });
                          },
                          child:
                              isPlaying
                                  ? Icon(Icons.play_arrow_rounded,color: ColorManager.secondaryColor,size: 25,)
                                  : Icon(Icons.pause,
                              color: ColorManager.secondaryColor,size: 25,),
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
                Text(StringsManager.moaarab),
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
                Text(StringsManager.arabic),
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
                SizedBox(width: 6.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  options() {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        reverse: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: TuneDetailsView.options.length,
        itemBuilder: (context, index) {
          return CustomContainer(
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                  width: 24.h,
                  child: TuneDetailsView.options[index].icon,
                ),
                Text(TuneDetailsView.options[index].title),
              ],
            ),
          );
        },
      ),
    );
  }
}
