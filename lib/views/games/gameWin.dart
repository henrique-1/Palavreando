import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class GameWin extends StatefulWidget {
  final String characterFullBody;
  final String character;
  final String characterSad;
  const GameWin({
    super.key,
    required this.characterFullBody,
    required this.character,
    required this.characterSad,
  });

  @override
  State<GameWin> createState() => _GameWinState();
}

class _GameWinState extends State<GameWin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "PARABÉNS",
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
        alignment: Alignment.center,
        children: [
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
                Image.asset(
                  'lib/assets/images/telaAcertou.png',
                  fit: BoxFit.fitHeight,
                  height: 0.9.sh,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: 320.w,
                decoration: BoxDecoration(
                    color: Colors.orange.shade300,
                    border: Border.all(
                      color: Colors.deepOrange.shade900,
                      width: 2.5.w,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16.r))),
                child: Text(
                  "Você venceu!",
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
                height: 350.h,
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
                  Navigator.pushNamed(
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
          Positioned(
            top: 10.h,
            child: Image.asset(
              widget.character,
              fit: BoxFit.fitWidth,
              height: 400.h,
              width: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}
