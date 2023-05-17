import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PALAVREANDO",
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.none,
            fontSize: 46,
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
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      maximumSize: const Size(200, 70),
                      minimumSize: const Size(200, 70),
                      backgroundColor: Colors.orange[300],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/chooseCharacter");
                    },
                    label: Text(
                      "JOGAR",
                      style: GoogleFonts.dynaPuff(
                        decoration: TextDecoration.none,
                        fontSize: 36,
                        color: Colors.deepOrange[900],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    icon: PhosphorIcon(
                      PhosphorIcons.regular.play,
                      size: 36.0,
                      color: Colors.deepOrange[900],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/aboutUs");
        },
        backgroundColor: Colors.orange[300],
        label: Text(
          'Sobre nós',
          style: GoogleFonts.dynaPuff(
            decoration: TextDecoration.none,
            fontSize: 12,
            color: Colors.deepOrange[900],
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        icon: PhosphorIcon(
          PhosphorIcons.regular.usersThree,
          size: 36.0,
          color: Colors.deepOrange[900],
        ),
      ),
    );
  }
}
