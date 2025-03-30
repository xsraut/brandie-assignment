import 'package:brandie_assignment/src/main_page.dart';
import 'package:brandie_assignment/src/routing/app_router.dart';
import 'package:brandie_assignment/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = MyAppRouter();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: appRouter.router,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().themeData,
        );
      },
      child: const MainPage(),
    );
  }
}
