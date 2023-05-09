import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GameBanana extends StatefulWidget {
  const GameBanana({super.key});

  @override
  State<GameBanana> createState() => _GameBananaState();
}

class _GameBananaState extends State<GameBanana> {
  bool _isBDropped = false;
  bool _isA1Dropped = false;
  bool _isN1Dropped = false;
  bool _isA2Dropped = false;
  bool _isN2Dropped = false;
  bool _isA3Dropped = false;
  final String _b = "B";
  final String _a = "A";
  final String _n = "N";

  int _erros = 0;

  bool _showTipOne = false;
  bool _showTipTwo = false;
  bool _showTipThree = false;

  dynamic dataFix;

  dynamic decodeJson(dynamic l) {
    Map<String, dynamic> game = jsonDecode(l);

    return game;
  }

  void verificaPerdeu() {
    if (_erros == 1) {
      setState(() {
        _showTipOne = true;
      });
    } else if (_erros == 3) {
      setState(() {
        _showTipTwo = true;
      });
    } else if (_erros == 4) {
      setState(() {
        _showTipThree = true;
      });
    } else if (_erros == 5) {
      print("Perdeu");
    }
  }

  void verificaGanhou() {
    if (_isBDropped &&
        _isA1Dropped &&
        _isN1Dropped &&
        _isA2Dropped &&
        _isN2Dropped &&
        _isA3Dropped) {
      print("Ganhou");
    }
  }

  bool isTipEnabled() {
    print(_showTipOne);
    print(_showTipTwo);
    print(_showTipThree);
    if (_showTipOne == true) {
      return false;
    } else if (_showTipTwo == true) {
      return false;
    } else if (_showTipThree == true) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FRUTA",
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.none,
            fontSize: 24,
            fontFamily: GoogleFonts.dynaPuff().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue[400],
        centerTitle: true,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
      ),
      body: Stack(
        children: [
          //Tip 1
          Visibility(
            visible: _showTipOne,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(125),
                      ),
                      border: Border.all(
                          color: Colors.black,
                          width: 3.5,
                          style: BorderStyle.solid),
                    ),
                    child: Center(
                      child: Text(
                        "Os macacos me adoram!",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    height: 75,
                    width: 150,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          _showTipOne = false;
                        });
                      },
                      backgroundColor: Colors.orange[300],
                      label: Text(
                        'OKAY',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 12,
                          color: Colors.deepOrange[900],
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: Icon(
                        PhosphorIcons.regular.thumbsUp,
                        size: 36.0,
                        color: Colors.deepOrange[900],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              // FloatingActionButton: FloatingActionButton.extended(
              //   onPressed: () {
              //     setState(() {
              //       _showTipOne = false;
              //     });
              //   },
              //   backgroundColor: Colors.orange[300],
              //   label: Text(
              //     'OKAY',
              //     style: TextStyle(
              //       decoration: TextDecoration.none,
              //       fontSize: 12,
              //       color: Colors.deepOrange[900],
              //       fontFamily: GoogleFonts.dynaPuff().fontFamily,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   icon: Icon(
              //     PhosphorIcons.regular.thumbsUp,
              //     size: 36.0,
              //     color: Colors.deepOrange[900],
              //   ),
              // ),
            ),
          ),

          //Game
          Visibility(
            visible: isTipEnabled(),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DragTarget(
                        onWillAccept: (data) {
                          dataFix = decodeJson(data);
                          if (dataFix['draggableName'] != "B") {
                            if (dataFix['letter'] != _b) {
                              _erros += 1;
                              print("Erros: $_erros");
                              verificaPerdeu();
                            }
                          }

                          print(dataFix['letter'] == _b &&
                              dataFix['draggableName'] == "B");
                          return dataFix['letter'] == _b &&
                              dataFix['draggableName'] == "B";
                        },
                        onAccept: (data) {
                          setState(() {
                            _isBDropped = true;
                          });
                          verificaGanhou();
                        },
                        builder: (BuildContext context, List<dynamic> accepted,
                                List<dynamic> rejected) =>
                            Container(
                          color: Colors.white,
                          height: 100,
                          width: 60,
                          child: _isBDropped
                              ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "B",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    border: Border.all(
                                      color: Colors.grey.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.grey.shade800,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      DragTarget(
                        onWillAccept: (data) {
                          dataFix = decodeJson(data);

                          if (dataFix['draggableName'] == "A1") {
                            if (_isA1Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          } else if (dataFix['draggableName'] == "A2") {
                            if (_isA2Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          } else if (dataFix['draggableName'] == "A3") {
                            if (_isA3Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          }

                          return dataFix['letter'] == _a;
                        },
                        onAccept: (data) {
                          dataFix = decodeJson(data);

                          setState(
                            () {
                              if (dataFix['draggableName'] == "A1") {
                                _isA1Dropped = true;
                              } else if (dataFix['draggableName'] == "A2") {
                                _isA2Dropped = true;
                              } else if (dataFix['draggableName'] == "A3") {
                                _isA3Dropped = true;
                              }
                            },
                          );
                          verificaGanhou();
                        },
                        builder: (BuildContext context, List<dynamic> accepted,
                                List<dynamic> rejected) =>
                            Container(
                          color: Colors.white,
                          height: 100,
                          width: 60,
                          child: _isA1Dropped
                              ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    border: Border.all(
                                      color: Colors.grey.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.grey.shade800,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      DragTarget(
                        onWillAccept: (data) {
                          dataFix = decodeJson(data);

                          if (dataFix['draggableName'] == "N1") {
                            if (!_isN1Dropped) {
                              if (dataFix['letter'] != _n) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          } else if (dataFix['draggableName'] == "N2") {
                            if (!_isN2Dropped) {
                              if (dataFix['letter'] != _n) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          }

                          return dataFix['letter'] == _n;
                        },
                        onAccept: (data) {
                          dataFix = decodeJson(data);

                          setState(
                            () {
                              if (dataFix['draggableName'] == "N1") {
                                _isN1Dropped = true;
                              } else if (dataFix['draggableName'] == "N2") {
                                _isN2Dropped = true;
                              }
                            },
                          );
                          verificaGanhou();
                        },
                        builder: (BuildContext context, List<dynamic> accepted,
                                List<dynamic> rejected) =>
                            Container(
                          color: Colors.white,
                          height: 100,
                          width: 60,
                          child: _isN1Dropped
                              ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "N",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    border: Border.all(
                                      color: Colors.grey.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.grey.shade800,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      DragTarget(
                        onWillAccept: (data) {
                          dataFix = decodeJson(data);

                          if (dataFix['draggableName'] == "A1") {
                            if (_isA1Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          } else if (dataFix['draggableName'] == "A2") {
                            if (_isA2Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          } else if (dataFix['draggableName'] == "A3") {
                            if (_isA3Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          }

                          return dataFix['letter'] == _a;
                        },
                        onAccept: (data) {
                          dataFix = decodeJson(data);

                          setState(
                            () {
                              if (dataFix['draggableName'] == "A1") {
                                _isA1Dropped = true;
                              } else if (dataFix['draggableName'] == "A2") {
                                _isA2Dropped = true;
                              } else if (dataFix['draggableName'] == "A3") {
                                _isA3Dropped = true;
                              }
                            },
                          );
                          verificaGanhou();
                        },
                        builder: (BuildContext context, List<dynamic> accepted,
                                List<dynamic> rejected) =>
                            Container(
                          color: Colors.white,
                          height: 100,
                          width: 60,
                          child: _isA2Dropped
                              ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    border: Border.all(
                                      color: Colors.grey.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.grey.shade800,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      DragTarget(
                        onWillAccept: (data) {
                          dataFix = decodeJson(data);

                          if (dataFix['draggableName'] == "N1") {
                            if (!_isN1Dropped) {
                              if (dataFix['letter'] != _n) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          } else if (dataFix['draggableName'] == "N2") {
                            if (!_isN2Dropped) {
                              if (dataFix['letter'] != _n) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          }

                          return dataFix['letter'] == _n;
                        },
                        onAccept: (data) {
                          dataFix = decodeJson(data);

                          setState(
                            () {
                              if (dataFix['draggableName'] == "N1") {
                                _isN1Dropped = true;
                              } else if (dataFix['draggableName'] == "N2") {
                                _isN2Dropped = true;
                              }
                            },
                          );
                          verificaGanhou();
                        },
                        builder: (BuildContext context, List<dynamic> accepted,
                                List<dynamic> rejected) =>
                            Container(
                          color: Colors.white,
                          height: 100,
                          width: 60,
                          child: _isN2Dropped
                              ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "N",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    border: Border.all(
                                      color: Colors.grey.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.grey.shade800,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      DragTarget(
                        onWillAccept: (data) {
                          dataFix = decodeJson(data);

                          if (dataFix['draggableName'] == "A1") {
                            if (_isA1Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          } else if (dataFix['draggableName'] == "A2") {
                            if (_isA2Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          } else if (dataFix['draggableName'] == "A3") {
                            if (_isA3Dropped == false) {
                              if (dataFix['letter'] != _a) {
                                _erros += 1;
                                print("Erros: $_erros");
                                verificaPerdeu();
                              }
                            }
                          }

                          return dataFix['letter'] == _a;
                        },
                        onAccept: (data) {
                          dataFix = decodeJson(data);

                          setState(
                            () {
                              if (dataFix['draggableName'] == "A1") {
                                _isA1Dropped = true;
                              } else if (dataFix['draggableName'] == "A2") {
                                _isA2Dropped = true;
                              } else if (dataFix['draggableName'] == "A3") {
                                _isA3Dropped = true;
                              }
                            },
                          );
                          verificaGanhou();
                        },
                        builder: (BuildContext context, List<dynamic> accepted,
                                List<dynamic> rejected) =>
                            Container(
                          color: Colors.white,
                          height: 100,
                          width: 60,
                          child: _isA3Dropped
                              ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    border: Border.all(
                                      color: Colors.grey.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.grey.shade800,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Visibility(
                            visible: !_isA3Dropped,
                            child: Draggable<String>(
                              data: '{"draggableName": "A3", "letter": "$_a"}',
                              feedback: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Container(),
                              child: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isA3Dropped,
                            child: Container(
                              height: 100,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                border: Border.all(
                                  color: Colors.grey.shade900,
                                  width: 2.5,
                                ),
                              ),
                              child: Text(
                                "A",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 44,
                                  color: Colors.grey.shade800,
                                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Visibility(
                            visible: !_isA1Dropped,
                            child: Draggable<Object>(
                              data: '{"draggableName": "A1", "letter": "$_a"}',
                              feedback: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Container(),
                              child: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isA1Dropped,
                            child: Container(
                              height: 100,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                border: Border.all(
                                  color: Colors.grey.shade900,
                                  width: 2.5,
                                ),
                              ),
                              child: Text(
                                "A",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 44,
                                  color: Colors.grey.shade800,
                                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Visibility(
                            visible: !_isN1Dropped,
                            child: Draggable<String>(
                              data: '{"draggableName": "N1", "letter": "$_n"}',
                              feedback: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "N",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Container(),
                              child: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "N",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isN1Dropped,
                            child: Container(
                              height: 100,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                border: Border.all(
                                  color: Colors.grey.shade900,
                                  width: 2.5,
                                ),
                              ),
                              child: Text(
                                "N",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 44,
                                  color: Colors.grey.shade800,
                                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Visibility(
                            visible: !_isA2Dropped,
                            child: Draggable<String>(
                              data: '{"draggableName": "A2", "letter": "$_a"}',
                              feedback: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Container(),
                              child: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isA2Dropped,
                            child: Container(
                              height: 100,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                border: Border.all(
                                  color: Colors.grey.shade900,
                                  width: 2.5,
                                ),
                              ),
                              child: Text(
                                "A",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 44,
                                  color: Colors.grey.shade800,
                                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Visibility(
                            visible: !_isN2Dropped,
                            child: Draggable<String>(
                              data: '{"draggableName": "N2", "letter": "$_n"}',
                              feedback: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "N",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Container(),
                              child: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "N",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isN2Dropped,
                            child: Container(
                              height: 100,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                border: Border.all(
                                  color: Colors.grey.shade900,
                                  width: 2.5,
                                ),
                              ),
                              child: Text(
                                "N",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 44,
                                  color: Colors.grey.shade800,
                                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Visibility(
                            visible: !_isBDropped,
                            child: Draggable<Object>(
                              data: '{"draggableName": "B", "letter": "$_b"}',
                              feedback: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "B",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Container(),
                              child: SizedBox(
                                height: 100,
                                width: 60,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    border: Border.all(
                                      color: Colors.deepOrange.shade900,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Text(
                                    "B",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 44,
                                      color: Colors.deepOrange.shade900,
                                      fontFamily:
                                          GoogleFonts.dynaPuff().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isBDropped,
                            child: Container(
                              height: 100,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                border: Border.all(
                                  color: Colors.grey.shade900,
                                  width: 2.5,
                                ),
                              ),
                              child: Text(
                                "B",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 44,
                                  color: Colors.grey.shade800,
                                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //Background
          Container(
            child: Stack(),
          ),
        ],
      ),
    );
  }
}