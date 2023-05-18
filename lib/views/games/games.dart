import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String _tipo = "";
  String _palavra = "";
  List _wordArray = [];
  List _dicas = [];

  getDica() {
    int numDica = (Random().nextInt(_dicas.length) + 0);
    var dica = _dicas[numDica];
    _dicas.remove(dica);

    return dica;
  }

  readFile(pathWord) async {
    var jsonFile = await rootBundle.loadString(pathWord);
    Map<String, dynamic> word = json.decode(jsonFile);

    setState(
      () {
        _tipo = word['tipo'];
        _palavra = word['palavra'];
        _wordArray = _palavra.split("");
        _dicas = word['dicas'];
        _dicas.add(word['dicaImagem']);
      },
    );

    print(_tipo);
  }

  @override
  initState() {
    super.initState();
    var words = [
      "lib/assets/words/banana.json",
      "lib/assets/words/aviao.json",
      "lib/assets/words/boneca.json",
      "lib/assets/words/cachorro.json",
      "lib/assets/words/casa.json",
      "lib/assets/words/galinha.json",
      "lib/assets/words/gato.json",
      "lib/assets/words/lapis.json",
      "lib/assets/words/lua.json",
      "lib/assets/words/professora.json",
    ];

    var jsonFile = readFile(words[(Random().nextInt(words.length) + 0)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tipo.toUpperCase(),
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
          // Background
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.lime.shade200,
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: const [],
            ),
          ),
          // Game
          Visibility(
            child: Column(
              children: [
                // Drag Target
                GridView.count(
                  crossAxisCount: 6,
                  scrollDirection: Axis.vertical,
                  childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
                  children: List<Widget>.generate(
                    _palavra.length,
                    (index) {
                      return DragTarget(
                        builder: (context, candidateData, rejectedData) =>
                            const Text("A"),
                      );
                    },
                    growable: true,
                  ),
                ),
                // Draggable
                GridView.count(
                  crossAxisCount: 6,
                  scrollDirection: Axis.vertical,
                  childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
                  children: List<Widget>.generate(
                    _palavra.length,
                    (index) {
                      return DragTarget(
                        builder: (context, candidateData, rejectedData) =>
                            const Text("B"),
                      );
                    },
                    growable: true,
                  ),
                ),
              ],
            ),
            // child: GridView.count(
            //   crossAxisCount: 6,
            //   childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
            //   children: List.generate(
            //     _palavra.length,
            //     (index) {
            //       return DragTarget(
            //         builder: (context, candidateData, rejectedData) =>
            //             Container(child: const Text("A")),
            //       );
            //     },
            //   ),
            // ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton.extended(
          onPressed: null,
          backgroundColor: Colors.orange[300],
          label: Text(
            //'$_erros',
            "0",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 24,
              color: Colors.deepOrange[900],
              fontFamily: GoogleFonts.dynaPuff().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: PhosphorIcon(
            PhosphorIcons.regular.warning,
            size: 36.0,
            color: Colors.deepOrange[900],
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
