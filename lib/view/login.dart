// import material
import 'package:dogtinder/provider/cardProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/googleSignProvider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context, listen: false);
    provider.getData();
    return Scaffold(
      backgroundColor: const Color(0xffDFE6F1),
      body: SafeArea(
        child: SizedBox.expand(
            //google login button
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 20.h, 8.w, 20.h),
              child: Container(
                height: 300.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.r),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/dog.png'))),
              ),
            ),
            Column(
              children: [
                Text(
                  'Discover your',
                  style: GoogleFonts.lato(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text('Favourite dog here',
                    style: GoogleFonts.lato(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Explore the world of exciting',
                  style: GoogleFonts.lato(
                    letterSpacing: 0.5,
                    fontSize: 15.sp,
                    wordSpacing: 1,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(' dogs and find your favourite one',
                    style: GoogleFonts.lato(
                      letterSpacing: 0.5,
                      wordSpacing: 1,
                      fontSize: 15.sp,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.0.h),
              child: SizedBox(
                width: 250.w,
                height: 45.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 246, 145,
                        183), //Colors.black, // Color(0xff8a5e3b),
                    // foregroundColor: Colors.white,
                    textStyle: GoogleFonts.lato(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      //color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSigninProvider>(context,
                        listen: false);
                    provider.googleLogin(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 20.h,
                        width: 20.h,
                        image: const AssetImage('assets/images/googleLogo.png'),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text('Login with Google',
                          style: GoogleFonts.lato(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
