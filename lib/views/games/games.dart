import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Game extends StatefulWidget {
  final String characterFullBody;
  final String character;
  final String characterSad;
  const Game({
    super.key,
    required this.characterFullBody,
    required this.character,
    required this.characterSad,
  });

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String _tipo = "";
  String _palavra = "";
  List _wordArray = [];
  final List _randomWordArray = [];
  List _dicas = [];
  String _dica = "";
  int _errors = 0;
  final List<bool> _isDropped = [];
  final List<bool> _draggableReaction = [];
  bool _isTipEnabled = false;
  bool _isTipShow = false;

  verificaJogo() {
    bool allDropped = false;
    if (_errors >= 5) {
      print("Perdeu");
      Navigator.pushNamed(
        context,
        "/gameLost",
        arguments: [
          _tipo,
          _palavra,
          widget.characterFullBody,
          widget.character,
          widget.characterSad,
        ],
      );
    } else if ((_errors == 1 && !_isTipShow) ||
        (_errors == 3 && !_isTipShow) ||
        (_errors == 4 && !_isTipShow)) {
      print("Mostra dica");
      setState(() {
        _dica = getDica();
        _isTipEnabled = true;
      });
    } else {
      // for (int i = 0; i < _wordArray.length; i++) {
      //   allDropped = _isDropped[i] ? true : false;
      // }
      allDropped = _isDropped.contains(false) ? false : true;
      print(
          "Todas as letras estão na posição correta? ${allDropped.toString()}");
      if (allDropped) {
        print("Ganhou");
        Navigator.pushNamed(
          context,
          "/gameWin",
          arguments: [
            widget.characterFullBody,
            widget.character,
            widget.characterSad,
          ],
        );
      }
    }
  }

  addErrors() {
    setState(() {
      _errors += 1;
      _isTipShow = false;
    });
  }

  randomWordArray() {
    String aux = _randomWordArray[0];
    _randomWordArray.add(_randomWordArray[0]);
    _randomWordArray.remove(_randomWordArray[0]);
    _draggableReaction.add(true);
    return aux;
  }

  getDica() {
    int numDica = (Random().nextInt(_dicas.length) + 0);
    var dica = _dicas[numDica];
    _dicas.remove(dica);
    return dica;
  }

  startSetDropped() {
    for (int i = 0; i < _palavra.length; i++) {
      _isDropped.add(false);
    }
  }

  readFile(pathWord) async {
    var jsonFile = await rootBundle.loadString(pathWord);
    Map<String, dynamic> word = json.decode(jsonFile);

    setState(
      () {
        _tipo = word['tipo'];
        _palavra = word['palavra'];
        _wordArray = _palavra.split("");
        _randomWordArray.addAll(_wordArray);
        _randomWordArray.shuffle();
        _dicas = word['dicas'];
        _dicas.add(word['dicaImagem']);
      },
    );
    startSetDropped();
  }

  @override
  initState() {
    var words = [
      "lib/assets/words/banana.json",
      "lib/assets/words/aviao.json",
      "lib/assets/words/boneca.json",
      "lib/assets/words/casa.json",
      "lib/assets/words/gato.json",
      "lib/assets/words/lapis.json",
      "lib/assets/words/lua.json",
    ];

    readFile(words[(Random().nextInt(words.length) + 0)]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _tipo.toUpperCase(),
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
                Stack(
                  children: [
                    Visibility(
                      visible: _errors >= 5 ? false : true,
                      child: Image.asset(
                        widget.characterFullBody,
                        fit: BoxFit.fitHeight,
                        height: 240.h,
                        width: 160.w,
                      ),
                    ),
                    Visibility(
                      visible: _errors >= 5 ? true : false,
                      child: Image.asset(
                        widget.characterSad,
                        fit: BoxFit.fitHeight,
                        height: 240.h,
                        width: 160.w,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      left: 40.w,
                      bottom: 235.h,
                      child: Visibility(
                        visible: _errors == 0 ? true : false,
                        child: Transform.scale(
                          scaleX: -1,
                          child: Image.asset(
                            'lib/assets/images/gotas/gotaMenor.png',
                            fit: BoxFit.cover,
                            height: 75.h,
                            width: 75.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35.w,
                      bottom: 230.h,
                      child: Visibility(
                        visible: _errors == 1 ? true : false,
                        child: Transform.scale(
                          scaleX: -1,
                          child: Image.asset(
                            'lib/assets/images/gotas/gota2.png',
                            fit: BoxFit.cover,
                            height: 100.h,
                            width: 100.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35.w,
                      bottom: 225.h,
                      child: Visibility(
                        visible: _errors == 2 ? true : false,
                        child: Transform.scale(
                          scaleX: -1,
                          child: Image.asset(
                            'lib/assets/images/gotas/gota3.png',
                            fit: BoxFit.cover,
                            height: 100.h,
                            width: 100.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35.w,
                      bottom: 225.h,
                      child: Visibility(
                        visible: _errors == 3 ? true : false,
                        child: Transform.scale(
                          scaleX: -1,
                          child: Image.asset(
                            'lib/assets/images/gotas/gota4.png',
                            fit: BoxFit.cover,
                            height: 100.h,
                            width: 100.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35.w,
                      bottom: 225.h,
                      child: Visibility(
                        visible: _errors == 4 ? true : false,
                        child: Transform.scale(
                          scaleX: -1,
                          child: Image.asset(
                            'lib/assets/images/gotas/gota5.png',
                            fit: BoxFit.cover,
                            height: 100.h,
                            width: 100.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30.w,
                      bottom: 200.h,
                      child: Visibility(
                        visible: _errors == 5 ? true : false,
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
              ],
            ),
          ),
          // Game
          Visibility(
            visible: !_isTipEnabled,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.r),
                  height: 0.25.sh,
                  width: 1.0.sw,
                  alignment: Alignment.center,
                  child: GridView.count(
                    crossAxisCount: 6,
                    childAspectRatio: 3 / 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List<Widget>.generate(
                      _palavra.length,
                      (index) {
                        return DragTarget<String>(
                          onAccept: (data) {
                            if (jsonDecode(data)["letter"] ==
                                _wordArray[index].toUpperCase()) {
                              print("Letra certa");
                              setState(() {
                                _isDropped[index] = true;
                                _draggableReaction[jsonDecode(data)["index"]] =
                                    false;
                              });
                              print("Agora verifica o Jogo");
                              verificaJogo();
                            } else {
                              print("Letra errada");
                              addErrors();
                              verificaJogo();
                            }
                          },
                          builder: (context, candidateData, rejectedData) {
                            return _isDropped[index]
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 3.h,
                                      horizontal: 3.w,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade300,
                                      border: Border.all(
                                        color: Colors.deepOrange.shade900,
                                        width: 2.5.w,
                                      ),
                                    ),
                                    child: Text(
                                      _wordArray[index].toUpperCase(),
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 44.sp,
                                        color: Colors.deepOrange.shade900,
                                        fontFamily:
                                            GoogleFonts.dynaPuff().fontFamily,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 3.h,
                                      horizontal: 3.w,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      border: Border.all(
                                        color: Colors.grey.shade900,
                                        width: 2.5.w,
                                      ),
                                    ),
                                  );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.r),
                  height: 0.25.sh,
                  width: 1.0.sw,
                  child: GridView.count(
                    crossAxisCount: 6,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 3 / 5,
                    shrinkWrap: true,
                    children: List<Widget>.generate(
                      _palavra.length,
                      (index) {
                        var letter = randomWordArray().toUpperCase();
                        return Visibility(
                          visible: _draggableReaction[index],
                          child: Draggable(
                            data: '{"letter": "$letter", "index": $index}',
                            feedback: SizedBox(
                              height: 80.h,
                              width: 52.w,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade300,
                                  border: Border.all(
                                    color: Colors.deepOrange.shade900,
                                    width: 2.5.w,
                                  ),
                                ),
                                child: Text(
                                  letter,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 44.sp,
                                    color: Colors.deepOrange.shade900,
                                    fontFamily:
                                        GoogleFonts.dynaPuff().fontFamily,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            childWhenDragging: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 3.h,
                                horizontal: 3.w,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                border: Border.all(
                                  color: Colors.grey.shade900,
                                  width: 2.5.w,
                                ),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 3.h,
                                horizontal: 3.w,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.orange[300],
                                border: Border.all(
                                  color: Colors.deepOrange.shade900,
                                  width: 2.5.w,
                                ),
                              ),
                              child: Text(
                                letter,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 44.sp,
                                  color: Colors.deepOrange.shade900,
                                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tip
          Visibility(
            visible: _isTipEnabled,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: _dica.contains("/") ? 300.h : 150.h,
                    width: 1.0.sw,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade300,
                      border: Border.all(
                        color: Colors.deepOrange.shade900,
                        style: BorderStyle.solid,
                        width: 3.5.r,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          125.r,
                        ),
                      ),
                    ),
                    child: Center(
                      child: _dica.contains("/")
                          ? Image.asset(
                              _dica,
                            )
                          : Text(
                              _dica,
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange.shade900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    height: 75.h,
                    width: 150.w,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          _isTipEnabled = false;
                          _dica = "";
                          _isTipShow = true;
                        });
                      },
                      backgroundColor: Colors.orange.shade300,
                      label: Text(
                        "OKAY",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 22.sp,
                          color: Colors.deepOrange.shade900,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: PhosphorIcon(
                        PhosphorIcons.regular.thumbsUp,
                        size: 36.0.r,
                        color: Colors.deepOrange.shade900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: !_isTipEnabled,
        child: FloatingActionButton.extended(
          onPressed: null,
          backgroundColor: Colors.orange[300],
          label: Text(
            '$_errors',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 24.sp,
              color: Colors.deepOrange[900],
              fontFamily: GoogleFonts.dynaPuff().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: PhosphorIcon(
            PhosphorIcons.regular.warning,
            size: 36.0.r,
            color: Colors.deepOrange[900],
          ),
          elevation: 3.r,
        ),
      ),
    );
  }
}
