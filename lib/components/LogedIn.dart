import 'package:dogtinder/provider/cardProvider.dart';
import 'package:dogtinder/view/explore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatelessWidget {
  const LoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final provider = Provider.of<CardProvider>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: null,
          title: Text(
            'Doginder',
            style: GoogleFonts.lato(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff7d2813)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout, color: Color(0xffEA4C89)))
          ],
        ),
        backgroundColor: const Color(0xffDFE6F1),
        body: SafeArea(
            child: Center(
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xffDFE6F1),
                      Color(0xffDFE6F1),
                      Color.fromARGB(255, 246, 219, 230),
                    ]),
              ),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 60, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Wel',
                                      style: GoogleFonts.lato(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10.h),
                                  Text('come!',
                                      style: GoogleFonts.lato(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Card(
                                //elevation: 12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0.r),
                                  child: SizedBox(
                                    height: 180.h,
                                    width: 140.w,
                                    child: Image.network(
                                      user!.photoURL ??
                                          'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0.w, 0, 50.w, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${user.displayName}',
                                      style: GoogleFonts.lato(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5.h),
                                  Text('${user.email}',
                                      style: GoogleFonts.lato(
                                          fontSize: 15.sp,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5.h),
                                  Text('${user.phoneNumber}',
                                      style: GoogleFonts.lato(
                                          fontSize: 15.sp,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              likesCount('Red Likes', provider.red.toString()),
                              SizedBox(
                                width: 40.w,
                              ),
                              likesCount(
                                  'Blue Likes', provider.blue.toString()),
                              SizedBox(
                                width: 40.w,
                              ),
                              likesCount(
                                  'Black Likes', provider.black.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0.r),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              child: Text(
                            "Fall in love with a dog, and in many ways you enter a new orbit, a universe that features not just new colors but new rituals, new rules, a new way of experiencing attachment.",
                            style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45,
                              wordSpacing: 1,
                            ),
                          ))
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(),
                          SizedBox(
                            height: 45.h,
                            width: 150.w,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xffEA4C89),
                                  // foregroundColor: Colors.white,
                                  textStyle: GoogleFonts.lato(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    //color: Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Explore()));
                                  final provider = Provider.of<CardProvider>(
                                      context,
                                      listen: false);
                                  provider.getData();
                                },
                                child: Row(
                                  children: [
                                    Text('Explore',
                                        style: GoogleFonts.lato(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10.w),
                                    Icon(Icons.arrow_forward_rounded,
                                        size: 20.sp),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ])),
        )));
  }

  Column likesCount(String title, String count) {
    return Column(children: [
      Text(title,
          style: GoogleFonts.lato(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey)),
      SizedBox(height: 5.h),
      Text(count,
          style: GoogleFonts.lato(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black)),
    ]);
  }
}
