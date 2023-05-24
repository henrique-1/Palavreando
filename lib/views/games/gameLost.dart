import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class GameOver extends StatefulWidget {
  final String tipo;
  final String palavra;
  final String characterFullBody;
  final String character;
  final String characterSad;
  const GameOver({
    super.key,
    required this.tipo,
    required this.palavra,
    required this.characterFullBody,
    required this.character,
    required this.characterSad,
  });

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.tipo.toUpperCase(),
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.none,
            fontSize: 24.sp,
            fontFamily: GoogleFonts.dynaPuff().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue[400],
        centerTitle: true,
        elevation: 5.r,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0.r),
            bottomRight: Radius.circular(10.0.r),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade100,
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  'lib/assets/images/home.png',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.bottomRight,
                  width: 1.0.sw,
                  height: 1.0.sh,
                ),
                Transform.scale(
                  scaleX: -1,
                  child: Image.asset(
                    'lib/assets/images/tornera.png',
                    fit: BoxFit.fitHeight,
                    height: 330.h,
                    width: 100.w,
                  ),
                ),
                Image.asset(
                  widget.characterSad,
                  fit: BoxFit.fitHeight,
                  height: 240.h,
                  width: 160.w,
                ),
                Positioned(
                  left: 30.w,
                  bottom: 200.h,
                  child: Visibility(
                    visible: true,
                    child: Transform.scale(
                      scaleX: -1,
                      child: Image.asset(
                        'lib/assets/images/gotas/gota6.png',
                        fit: BoxFit.cover,
                        height: 100.h,
                        width: 100.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0.r),
            height: 1.0.sh,
            width: 1.0.sw,
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  height: 150.h,
                  width: 0.9.sw,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade300.withOpacity(.75),
                    border: Border.all(
                      color: Colors.deepOrange.shade900,
                      width: 2.5.w,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    "Oh não!\nVocê perdeu!",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 44.sp,
                      color: Colors.deepOrange.shade900,
                      fontFamily: GoogleFonts.dynaPuff().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade300,
                    maximumSize: Size(200.w, 70.h),
                    minimumSize: Size(100.w, 35.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.r),
                      ),
                    ),
                    side: BorderSide(
                      width: 2.5.r,
                      color: Colors.deepOrange.shade900,
                    ),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(
                      context,
                      "/game",
                      arguments: [
                        widget.characterFullBody,
                        widget.character,
                        widget.characterSad,
                      ],
                    );
                  },
                  child: Text(
                    "JOGAR NOVAMENTE",
                    style: GoogleFonts.dynaPuff(
                      decoration: TextDecoration.none,
                      fontSize: 26.sp,
                      color: Colors.deepOrange[900],
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade300,
                    maximumSize: Size(200.w, 70.h),
                    minimumSize: Size(100.w, 35.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.r),
                      ),
                    ),
                    side: BorderSide(
                      width: 2.5.r,
                      color: Colors.deepOrange.shade900,
                    ),
                  ),
                  onPressed: () {
                    Platform.operatingSystem == "ios"
                        ? exit(0)
                        : SystemNavigator.pop();
                  },
                  child: Text(
                    "SAIR",
                    style: GoogleFonts.dynaPuff(
                      decoration: TextDecoration.none,
                      fontSize: 26.sp,
                      color: Colors.deepOrange[900],
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
