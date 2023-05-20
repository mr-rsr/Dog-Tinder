import 'package:dogtinder/components/LogedIn.dart';
import 'package:dogtinder/provider/cardProvider.dart';
import 'package:dogtinder/view/explore.dart';
import 'package:dogtinder/view/homePage.dart';
import 'package:dogtinder/view/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/googleSignProvider.dart';
import 'view/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GoogleSigninProvider()),
    ChangeNotifierProvider(create: (_) => CardProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            //dark theme
            title: 'Doginder',
            home: SplashScreen(),
          );
        });
  }
}
