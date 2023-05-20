import 'dart:async';
import 'package:dogtinder/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/cardProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final provider = Provider.of<CardProvider>(context, listen: false);
    // provider.getData();
    provider.getDogImages();
    provider.getData();
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(),
          Image(
              image: const AssetImage('assets/images/logoDog.png'),
              height: 200.h,
              width: 200.w),
          Padding(
            padding: EdgeInsets.only(bottom: 80.0.h),
            child: Text(
              'Doginder',
              style: GoogleFonts.lato(
                  color: Color(0xff7d2813),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )),
    );
  }
}
