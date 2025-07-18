import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/app_theme.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/features/admin/admin_home.dart';
import 'package:ni_angelos/features/authentication/sign_in_view.dart';
import 'package:ni_angelos/features/child/child_home.dart';
import 'package:ni_angelos/features/coptic/presentation/coptic_details_view.dart';
import 'package:ni_angelos/features/coptic/presentation/coptic_view.dart';
import 'package:ni_angelos/features/home/home_view.dart';
import 'package:ni_angelos/features/home/main_screen.dart';
import 'package:ni_angelos/features/notifications/notifications_view.dart';
import 'package:ni_angelos/features/profile/profile_view.dart';
import 'package:ni_angelos/features/splash_screen/splash_screen.dart';
import 'package:ni_angelos/features/tunes/presentation/tune_details_view.dart';
import 'package:ni_angelos/features/tunes/presentation/tunes_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(375, 829),
      builder: (context, child) {
        return MaterialApp(
          title: 'Ni Angelos',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          initialRoute: RoutesManager.splashName,
          routes: {
            RoutesManager.splashName: (_) => SplashScreen(),
            RoutesManager.signInView: (_) => SignInView(),
            RoutesManager.adminHome: (_) => AdminHome(),
            RoutesManager.childHome: (_) => ChildHome(),
            RoutesManager.home: (_) => HomeView(),
            RoutesManager.main: (_) => MainScreen(),
            RoutesManager.notificationsView: (_) => NotificationsView(),
            RoutesManager.profile: (_) => ProfileView(),
            RoutesManager.tunes: (_) => TunesView(),
            RoutesManager.tuneDetails: (_) => TuneDetailsView(),
            RoutesManager.coptic :(_)=> CopticView(),
            RoutesManager.copticDetails :(_)=> CopticDetailsView(),
          },
        );
      },
    );
  }
}
