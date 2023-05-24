import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PALAVREANDO",
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.none,
            fontSize: 46.sp,
            fontFamily: GoogleFonts.dynaPuff().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue[400],
        centerTitle: true,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0.r),
            bottomRight: Radius.circular(10.0.r),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              //color: Colors.lime.shade200,
              color: Colors.lightBlue[200],
            ),
            child: Image.asset(
              'lib/assets/images/home.png',
              fit: BoxFit.fitHeight,
              alignment: Alignment.bottomRight,
              width: 1.0.sw,
              height: 1.0.sh,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.r),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 10.r,
                        top: 5.r,
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                          ),
                          fixedSize: Size(200.w, 70.h),
                          backgroundColor: Colors.orange[300],
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, "/chooseCharacter");
                          Navigator.popAndPushNamed(
                            context,
                            "/chooseCharacter",
                          );
                        },
                        label: Text(
                          "JOGAR",
                          style: GoogleFonts.dynaPuff(
                            decoration: TextDecoration.none,
                            fontSize: 36.sp,
                            color: Colors.deepOrange[900],
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        icon: PhosphorIcon(
                          PhosphorIcons.regular.play,
                          size: 36.0.r,
                          color: Colors.deepOrange[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/aboutUs");
        },
        backgroundColor: Colors.orange[300],
        label: Text(
          'Sobre nós',
          style: GoogleFonts.dynaPuff(
            decoration: TextDecoration.none,
            fontSize: 14.sp,
            color: Colors.deepOrange[900],
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        icon: PhosphorIcon(
          PhosphorIcons.regular.usersThree,
          size: 36.0.r,
          color: Colors.deepOrange[900],
        ),
      ),
    );
  }
}
