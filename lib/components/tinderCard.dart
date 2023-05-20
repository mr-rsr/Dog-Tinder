import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/cardProvider.dart';

class TinderCards extends StatefulWidget {
  const TinderCards({super.key, required this.urlImage, required this.isFront});

  final String urlImage;
  final bool isFront;
  @override
  State<TinderCards> createState() => _TinderCardsState();
}

class _TinderCardsState extends State<TinderCards> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 150.h,
        width: double.maxFinite,
        child: widget.isFront ? buildFrontCard() : buildCard());
  }

  Widget buildFrontCard() {
    return GestureDetector(
        onPanStart: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.startPosition(details);
        },
        onPanUpdate: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.updatePosition(details);
        },
        onPanEnd: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.endPosition();
        },
        child: Stack(
          children: [
            LayoutBuilder(builder: (context, constraints) {
              final provider = Provider.of<CardProvider>(context);
              final milliseconds = provider.isDragging ? 0 : 400;
              final center = constraints.smallest.center(Offset.zero);
              final position = provider.position;
              final angle = provider.angle * pi / 180;
              final rotateMatrix = Matrix4.identity()
                ..translate(center.dx, center.dy)
                ..rotateZ(angle)
                ..translate(-center.dx, -center.dy);
              return AnimatedContainer(
                curve: Curves.easeInOut,
                transform: rotateMatrix..translate(position.dx, position.dy),
                duration: Duration(milliseconds: milliseconds),
                child: buildCard(),
              );
            }),
            Positioned(
                bottom: 0.h,
                left: 0.w,
                right: 0.w,
                child: Container(
                  height: 100.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(1.0),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        redLike(context),
                        blackLike(context),
                        blueLike(context),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget blackLike(BuildContext context) {
    final provider = Provider.of<CardProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.all(5.0.r),
      child: Column(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            //circle shape
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2)
                //color: Colors.white,
                ),
            child: Center(
              child: Icon(
                Icons.favorite,
                color: Colors.black,
                size: 30.sp,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            provider.black.toString(),
            style: GoogleFonts.lato(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget redLike(BuildContext context) {
    final provider = Provider.of<CardProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.all(5.0.r),
      child: Column(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            //circle shape
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2)
                //color: Colors.white,
                ),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30.sp,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            provider.red.toString(),
            style: GoogleFonts.lato(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget blueLike(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    return Padding(
      padding: EdgeInsets.all(5.0.r),
      child: Column(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            //circle shape
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2)
                //color: Colors.white,
                ),
            child: Icon(
              Icons.favorite,
              color: Colors.blue,
              size: 30.sp,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            provider.blue.toString(),
            style: GoogleFonts.lato(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
            image: NetworkImage(widget.urlImage),
            fit: BoxFit.fill,
            alignment: const Alignment(-0.3, 0),
          ),
        ),
      ),
    );
  }
}
