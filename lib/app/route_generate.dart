import 'package:flutter/material.dart';
import 'package:palavreando/views/aboutUs.dart';
import 'package:palavreando/views/characterSelection.dart';
import 'package:palavreando/views/chooseCharacter.dart';
import 'package:palavreando/views/games/games.dart';
import 'package:palavreando/views/games/gameLost.dart';
import 'package:palavreando/views/games/gameWin.dart';
import 'package:palavreando/views/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const Home());
      case "/characterSelection":
        return MaterialPageRoute(
            builder: (_) =>
                CharacterSelection(gender: settings.arguments as int));
      case "/aboutUs":
        return MaterialPageRoute(builder: (_) => const AboutUs());
      case "/chooseCharacter":
        return MaterialPageRoute(builder: (_) => const ChooseCharacter());
      case "/game":
        return MaterialPageRoute(
          builder: (_) {
            var args = settings.arguments as List;
            return Game(
              characterFullBody: args[0].toString(),
              character: args[1].toString(),
              characterSad: args[2].toString(),
            );
          },
        );
      case "/gameLost":
        return MaterialPageRoute(
          builder: (_) {
            var args = settings.arguments as List;
            return GameOver(
              tipo: args[0].toString(),
              palavra: args[1].toString(),
              characterFullBody: args[2].toString(),
              character: args[3].toString(),
              characterSad: args[4].toString(),
            );
          },
        );
      case "/gameWin":
        return MaterialPageRoute(
          builder: (_) {
            var args = settings.arguments as List;
            return GameWin(
              characterFullBody: args[0].toString(),
              character: args[1].toString(),
              characterSad: args[2].toString(),
            );
          },
        );
      default:
        return _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tela não encontrada"),
          ),
          body: const Center(
            child: Text("Tela não encontrada"),
          ),
        );
      },
    );
  }
}
