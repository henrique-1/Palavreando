import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  readFile(pathWord) async {
    var jsonFile = await rootBundle.loadString(pathWord);
    Map<String, dynamic> word = json.decode(jsonFile);

    print(word['tipo']);
    print(word['palavra']);
    print(word['dicas']);
    print(word['dicaImagem']);
  }

  @override
  initState() {
    var words = [
      "lib/assets/words/banana.json",
    ];

    print((Random().nextInt(words.length) + 0).toString());
    //var jsonFile = readFile(words[(Random().nextInt(0) + 0)]);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
