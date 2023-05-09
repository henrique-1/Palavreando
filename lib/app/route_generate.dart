import 'package:flutter/material.dart';
import 'package:palavreando/views/aboutUs.dart';
import 'package:palavreando/views/characterSelection.dart';
import 'package:palavreando/views/chooseCharacter.dart';
import 'package:palavreando/views/games/gameBanana.dart';
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
      case "/gameBanana":
        return MaterialPageRoute(builder: (_) => const GameBanana());
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
