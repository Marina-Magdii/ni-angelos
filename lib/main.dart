import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/utils/app_theme.dart';
import 'package:ni_angelos/core/utils/routes_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ni_angelos/features/admin/admin_home.dart';
import 'package:ni_angelos/features/admin/attendance/presentation/attendance_view.dart';
import 'package:ni_angelos/features/admin/attendance/presentation/class_attendance_view.dart';
import 'package:ni_angelos/features/admin/children/presentation/child_details_view.dart';
import 'package:ni_angelos/features/admin/children/presentation/children_view.dart';
import 'package:ni_angelos/features/admin/children_check/presentation/children_check_view.dart';
import 'package:ni_angelos/features/admin/classes/presentation/class_details_view.dart';
import 'package:ni_angelos/features/admin/classes/presentation/classes_view.dart';
import 'package:ni_angelos/features/admin/teachers/presentation/teacher_details_view.dart';
import 'package:ni_angelos/features/admin/teachers/presentation/teachers_view.dart';
import 'package:ni_angelos/features/admin/teachers_check/presentation/teachers_check_view.dart';
import 'package:ni_angelos/features/admin/tunes/presentation/add_new_attachment_view.dart';
import 'package:ni_angelos/features/admin/tunes/presentation/add_new_tune_view.dart';
import 'package:ni_angelos/features/authentication/sign_in_view.dart';
import 'package:ni_angelos/features/child/child_home.dart';
import 'package:ni_angelos/features/child/coptic/presentation/coptic_details_view.dart';
import 'package:ni_angelos/features/child/coptic/presentation/coptic_view.dart';
import 'package:ni_angelos/features/child/mahfozat/presentation/mahfozat_details_view.dart';
import 'package:ni_angelos/features/child/mahfozat/presentation/mahfozat_view.dart';
import 'package:ni_angelos/features/child/notifications/notifications_view.dart';
import 'package:ni_angelos/features/child/profile/profile_view.dart';
import 'package:ni_angelos/features/child/taks/presentation/taks_details_view.dart';
import 'package:ni_angelos/features/child/taks/presentation/taks_view.dart';
import 'package:ni_angelos/features/child/tunes/presentation/tune_details_view.dart';
import 'package:ni_angelos/features/child/tunes/presentation/tunes_view.dart';
import 'package:ni_angelos/features/home/home_view.dart';
import 'package:ni_angelos/features/home/main_screen.dart';
import 'package:ni_angelos/features/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar');
  await initializeDateFormatting('en');
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
            RoutesManager.taks :(_)=> TaksView(),
            RoutesManager.taksDetails :(_)=> TaksDetailsView(),
            RoutesManager.mahfozat:(_)=> MahfozatView(),
            RoutesManager.mahfozatDetails :(_)=> MahfozatDetailsView(),
            RoutesManager.attendance :(_)=> AttendanceView(),
            RoutesManager.children :(_)=> ChildrenView(),
            RoutesManager.childrenCheck :(_)=> ChildrenCheckView(),
            RoutesManager.classes :(_)=> ClassesView(),
            RoutesManager.classDetails :(_)=> ClassDetailsView(),
            RoutesManager.teachers :(_)=> TeachersView(),
            RoutesManager.teachersCheck :(_)=> TeachersCheckView(),
            RoutesManager.newTune :(_)=> AddNewTuneView(),
            RoutesManager.newFile :(_)=> AddNewAttachmentView(),
            RoutesManager.childDetails :(_)=> ChildDetailsView(),
            RoutesManager.teacherDetails :(_)=> TeacherDetailsView(),
            RoutesManager.classAttendance :(_)=> ClassAttendanceView(),
          },
        );
      },
    );
  }
}
