import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        padding: const EdgeInsets.all(16),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.lime[200],
        ),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/characterSelection",
                    arguments: 0);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(190, 350),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent.withOpacity(0.5),
              ),
              child: Image.asset(
                'lib/assets/images/characterSelect/boy/Menino1.png',
                fit: BoxFit.fill,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/characterSelection",
                    arguments: 1);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(190, 350),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent.withOpacity(0.5),
              ),
              child: Image.asset(
                'lib/assets/images/characterSelect/girl/Menina1.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}