import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCharacter extends StatelessWidget {
  const ChooseCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SELECIONE O SEU GÊNERO",
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.none,
            fontSize: 22.sp,
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
      body: Container(
        padding: EdgeInsets.all(8.r),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.lime[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/characterSelection",
                    arguments: 0);
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(163.w, 300.h),
                //fixedSize: const Size(190, 350),
                minimumSize: Size(25.w, 46.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent.withOpacity(0.5),
              ),
              child: Image.asset(
                'lib/assets/images/characterSelect/boy/Menino1.png',
                fit: BoxFit.cover,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/characterSelection",
                    arguments: 1);
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(163.w, 300.h),
                //fixedSize:  Size(190.w, 350.h),
                minimumSize: Size(25.w, 46.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent.withOpacity(0.5),
              ),
              child: Image.asset(
                'lib/assets/images/characterSelect/girl/Menina1.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
