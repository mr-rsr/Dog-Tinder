import 'package:dogtinder/components/LogedIn.dart';
import 'package:dogtinder/provider/cardProvider.dart';
import 'package:dogtinder/components/tinderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<CardProvider>(context);
    // provider.getDogImages();
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     backgroundColor: Color.fromARGB(255, 224, 147, 177),
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.search,
      //           color: Colors.black,
      //           size: 30,
      //         ),
      //         label: 'Explore',
      //         backgroundColor: Colors.white,
      //       ),
      //       BottomNavigationBarItem(
      //           icon:
      //               Icon(Icons.person_2_rounded, color: Colors.black, size: 30),
      //           label: 'Profile',
      //           backgroundColor: Colors.white),
      //     ],
      //     currentIndex: 0,
      //     selectedItemColor: Color(0xff7d2813),
      //     onTap: (index) {
      //       if (index == 1) {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) {
      //           return const LoggedIn();
      //         }));
      //       }
      //     }),
      backgroundColor: const Color(0xffDFE6F1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 147, 177),
        elevation: 0,
        title: Text('Doginder',
            style: GoogleFonts.lato(
                color: const Color(0xff7d2813),
                fontSize: 25.sp,
                fontWeight: FontWeight.bold)),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Image(
            image: AssetImage('assets/images/logoDog.png'),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16.r),
          child: BuildCards(),
        ),
      ),
    );
  }

  Widget BuildCards() {
    final provider = Provider.of<CardProvider>(context);
    final urlImages = provider.urlImages;
    return Stack(
      children: urlImages!
          .map((urlImage) => TinderCards(
                urlImage: urlImage,
                isFront: urlImages.last == urlImage,
              ))
          .toList(),
    );
  }
}
