import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CharacterSelection extends StatefulWidget {
  final int gender;
  const CharacterSelection({super.key, required this.gender});

  @override
  State<CharacterSelection> createState() => _CharacterSelectionState();
}

class _CharacterSelectionState extends State<CharacterSelection> {
  int _index = 0;
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SELECIONE O PERSONAGEM",
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
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.lime[200],
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = 1;
                      _isSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    maximumSize: const Size(190, 350),
                    //fixedSize: const Size(190, 350),
                    minimumSize: const Size(25, 46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: _index == 1
                            ? Colors.deepOrange.shade900
                            : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    shadowColor: Colors.transparent.withOpacity(0.5),
                  ),
                  child: Image.asset(
                    widget.gender == 1
                        ? 'lib/assets/images/characterSelect/girl/Menina1.png'
                        : 'lib/assets/images/characterSelect/boy/Menino1.png',
                    fit: BoxFit.fill,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = 2;
                      _isSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    maximumSize: const Size(190, 350),
                    //fixedSize: const Size(190, 350),
                    minimumSize: const Size(25, 46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: _index == 2
                            ? Colors.deepOrange.shade900
                            : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    shadowColor: Colors.transparent.withOpacity(0.5),
                  ),
                  child: Image.asset(
                    widget.gender == 1
                        ? 'lib/assets/images/characterSelect/girl/Menina2.png'
                        : 'lib/assets/images/characterSelect/boy/Menino2.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = 3;
                      _isSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    maximumSize: const Size(190, 350),
                    //fixedSize: const Size(190, 350),
                    minimumSize: const Size(25, 46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: _index == 3
                            ? Colors.deepOrange.shade900
                            : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    shadowColor: Colors.transparent.withOpacity(0.5),
                  ),
                  child: Image.asset(
                    widget.gender == 1
                        ? 'lib/assets/images/characterSelect/girl/Menina3.png'
                        : 'lib/assets/images/characterSelect/boy/Menino3.png',
                    fit: BoxFit.fill,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index = 4;
                      _isSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    maximumSize: const Size(190, 350),
                    //fixedSize: const Size(190, 350),
                    minimumSize: const Size(25, 46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: _index == 4
                            ? Colors.deepOrange.shade900
                            : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    shadowColor: Colors.transparent.withOpacity(0.5),
                  ),
                  child: Image.asset(
                    widget.gender == 1
                        ? 'lib/assets/images/characterSelect/girl/Menina4.png'
                        : 'lib/assets/images/characterSelect/boy/Menino4.png',
                    fit: BoxFit.fill,
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
            Navigator.pushNamed(context, "/gameBanana");
          } else {
            const snack = SnackBar(
              content: Text("Selecione um personagem primeiro"),
              duration: Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        backgroundColor: _isSelected ? Colors.orange[300] : Colors.grey[700],
        label: Text(
          'JOGAR',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 12,
            color: _isSelected ? Colors.deepOrange[900] : Colors.black,
            fontFamily: GoogleFonts.dynaPuff().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: PhosphorIcon(
          PhosphorIcons.regular.play,
          size: 36.0,
          color: _isSelected ? Colors.deepOrange[900] : Colors.black,
        ),
      ),
    );
  }
}
