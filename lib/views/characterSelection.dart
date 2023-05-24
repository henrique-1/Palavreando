import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterSelection extends StatefulWidget {
  final int gender;
  const CharacterSelection({super.key, required this.gender});

  @override
  State<CharacterSelection> createState() => _CharacterSelectionState();
}

class _CharacterSelectionState extends State<CharacterSelection> {
  int _index = 0;

  final _snack = SnackBar(
    content: Text(
      "Vamos jogar!",
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 24.sp,
        color: Colors.deepOrange[900],
        fontFamily: GoogleFonts.dynaPuff().fontFamily,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: Colors.orange[300],
  );

  final _snackError = SnackBar(
    content: Text(
      "Selecione um personagem primeiro.",
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 18.sp,
        color: Colors.deepOrange[900],
        fontFamily: GoogleFonts.dynaPuff().fontFamily,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.orange[300],
    duration: const Duration(seconds: 2),
  );

  String _characterSelected = "";
  String _character = "";
  String _characterSad = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SELECIONE O PERSONAGEM",
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
        decoration: BoxDecoration(
          color: Colors.lime[200],
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _index = 1;
                        if (widget.gender == 1) {
                          _characterSelected =
                              'lib/assets/images/character/girl/meninaCabeloMarromForca.png';
                          _character =
                              'lib/assets/images/characterSelect/girl/Menina1.png';
                          _characterSad =
                              'lib/assets/images/character/girl/cry/MeninaCabeloMarromChorando.png';
                        } else {
                          _characterSelected =
                              "lib/assets/images/character/boy/meninoCabeloMarromForca.png";
                          _character =
                              'lib/assets/images/characterSelect/boy/Menino1.png';
                          _characterSad =
                              'lib/assets/images/character/boy/cry/MeninoCabeloMarromChorando.png';
                        }
                      },
                    );

                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(_snack);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    maximumSize: Size(163.w, 300.h),
                    //fixedSize: const Size(190, 350),
                    minimumSize: Size(25.w, 46.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: BorderSide(
                        color: _index == 1
                            ? Colors.deepOrange.shade900
                            : Colors.transparent,
                        width: 2.5.r,
                      ),
                    ),
                    shadowColor: Colors.transparent.withOpacity(0.5),
                  ),
                  child: Image.asset(
                    widget.gender == 1
                        ? 'lib/assets/images/characterSelect/girl/Menina1.png'
                        : 'lib/assets/images/characterSelect/boy/Menino1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _index = 2;
                        if (widget.gender == 1) {
                          _characterSelected =
                              'lib/assets/images/character/girl/meninaCabeloPretoForca.png';
                          _character =
                              'lib/assets/images/characterSelect/girl/Menina2.png';
                          _characterSad =
                              'lib/assets/images/character/girl/cry/MeninaCabeloPretoChorando.png';
                        } else {
                          _characterSelected =
                              "lib/assets/images/character/boy/meninoCabeloPretoForca.png";
                          _character =
                              'lib/assets/images/characterSelect/boy/Menino2.png';
                          _characterSad =
                              'lib/assets/images/character/boy/cry/MeninoCabeloPretoChorando.png';
                        }
                      },
                    );

                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(_snack);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    maximumSize: Size(163.w, 300.h),
                    //fixedSize: const Size(190, 350),
                    minimumSize: Size(25.w, 46.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: BorderSide(
                        color: _index == 2
                            ? Colors.deepOrange.shade900
                            : Colors.transparent,
                        width: 2.5.r,
                      ),
                    ),
                    shadowColor: Colors.transparent.withOpacity(0.5),
                  ),
                  child: Image.asset(
                    widget.gender == 1
                        ? 'lib/assets/images/characterSelect/girl/Menina2.png'
                        : 'lib/assets/images/characterSelect/boy/Menino2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _index = 3;
                        if (widget.gender == 1) {
                          _characterSelected =
                              'lib/assets/images/character/girl/meninaCabeloLoiroForca.png';
                          _character =
                              'lib/assets/images/characterSelect/girl/Menina3.png';
                          _characterSad =
                              'lib/assets/images/character/girl/cry/MeninaCabeloLoiroChorando.png';
                        } else {
                          _characterSelected =
                              "lib/assets/images/character/boy/meninoCabeloLoiroForca.png";
                          _character =
                              'lib/assets/images/characterSelect/boy/Menino3.png';
                          _characterSad =
                              'lib/assets/images/character/boy/cry/MeninoCabeloLoiroChorando.png';
                        }
                      },
                    );
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(_snack);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    maximumSize: Size(163.w, 300.h),
                    //fixedSize: const Size(190, 350),
                    minimumSize: Size(25.w, 46.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: BorderSide(
                        color: _index == 3
                            ? Colors.deepOrange.shade900
                            : Colors.transparent,
                        width: 2.5.r,
                      ),
                    ),
                    shadowColor: Colors.transparent.withOpacity(0.5),
                  ),
                  child: Image.asset(
                    widget.gender == 1
                        ? 'lib/assets/images/characterSelect/girl/Menina3.png'
                        : 'lib/assets/images/characterSelect/boy/Menino3.png',
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _index = 4;
                        if (widget.gender == 1) {
                          _characterSelected =
                              'lib/assets/images/character/girl/meninaCabeloRuivoForca.png';
                          _character =
                              'lib/assets/images/characterSelect/girl/Menina4.png';
                          _characterSad =
                              'lib/assets/images/character/girl/cry/MeninaCabeloRuivoChorando.png';
                        } else {
                          _characterSelected =
                              "lib/assets/images/character/boy/meninoCabeloRuivoForca.png";
                          _character =
                              'lib/assets/images/characterSelect/boy/Menino4.png';
                          _characterSad =
                              'lib/assets/images/character/boy/cry/MeninoCabeloRuivoChorando.png';
                        }
                      },
                    );
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(_snack);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    maximumSize: Size(163.w, 300.h),
                    //fixedSize: const Size(190, 350),
                    minimumSize: Size(25.w, 46.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: BorderSide(
                        color: _index == 4
                            ? Colors.deepOrange.shade900
                            : Colors.transparent,
                        width: 2.5.r,
                      ),
                    ),
                    shadowColor: Colors.transparent.withOpacity(0.5),
                  ),
                  child: Image.asset(
                    widget.gender == 1
                        ? 'lib/assets/images/characterSelect/girl/Menina4.png'
                        : 'lib/assets/images/characterSelect/boy/Menino4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_index != 0) {
            Navigator.popAndPushNamed(
              context,
              "/game",
              arguments: [_characterSelected, _character, _characterSad],
            );
          } else {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(_snackError);
          }
        },
        backgroundColor: _index != 0 ? Colors.orange[300] : Colors.grey[700],
        label: Text(
          'JOGAR',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 24.sp,
            color: _index != 0 ? Colors.deepOrange[900] : Colors.black,
            fontFamily: GoogleFonts.dynaPuff().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: PhosphorIcon(
          PhosphorIcons.regular.play,
          size: 36.0.sp,
          color: _index != 0 ? Colors.deepOrange[900] : Colors.black,
        ),
      ),
    );
  }
}
