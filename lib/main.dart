import 'package:dielegende_store/core/utils/app_router.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: mainColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      child: MaterialApp.router(
        locale: const Locale(
          'en',
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routerConfig: appRouter,
      ),
    );
  }
}
