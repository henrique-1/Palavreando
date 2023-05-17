import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SOBRE NÓS",
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
        child: ListView(
          children: <Widget>[
            Text(
              "O Aplicativo",
              style: TextStyle(
                fontSize: 24,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              "Palavreando é um aplicativo lúdico e divertido em que a criança deve acertar qual é a palavra proposta tendo como dica o número de letras e o tema ligado à palavra.",
              style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.justify,
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text(
              "O Projeto",
              style: TextStyle(
                fontSize: 24,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              "A alfabetização é mais do que saber ler e escrever. Ela é a porta de entrada para que o indivíduo se torne um ser letrado, atuante e crítico dentro da sociedade, por isso, é muito importante que o processo de aquisição desse conhecimento alcance o maior número possível de pessoas. No contexto infantil, sabe-se do valor dos jogos no desenvolvimento cognitivo e como eles podem ser um grande aliado no aprendizado, incluindo crianças que se encontram no Transtorno do Espectro Autista (TEA), que podem demandar diferentes métodos para se alcançar o mesmo objetivo. O trabalho apresenta o desenvolvimento de um aplicativo de jogo educacional para auxiliar na alfabetização tanto de crianças neurotípicas quanto neuroatípicas, buscando atingir as seguintes habilidades da Base Nacional Curricular Comum.",
              style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 5),
            Text(
              "EF02LP02 - Segmentar palavras em sílabas e remover e substituir sílabas iniciais, mediais ou finais para criar novas palavras",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 5),
            Text(
              "EF02LP03 - Ler e escrever palavras com correspondências regulares diretas entre letras e fonemas (f, v, t, d, p, b) e correspondências regulares contextuais (c e q; e e o, em posição átona em final de palavra)",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 5),
            Text(
              "EF02LP04 - Ler e escrever corretamente palavras com sílabas CV, V, CVC, CCV, identificando que existem vogais em todas as sílabas.",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: GoogleFonts.dynaPuff().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.justify,
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text(
              "Alunos da UniFAE",
              style: TextStyle(
                fontSize: 24,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'lib/assets/images/developers/bia.jpeg',
                          width: 113,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Bia Jordão",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Escreveu o projeto",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'lib/assets/images/developers/marina.jpeg',
                          width: 178,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Marina",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Escreveu o projeto",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'lib/assets/images/developers/naiara.jpeg',
                          width: 113,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Naiara",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Escreveu o projeto",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'lib/assets/images/developers/silvia.jpeg',
                          width: 100,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Silvia Ferrante",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Escreveu o projeto",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text(
              "Alunos do Instituto Federal de Educação, Ciência e Tecnologia de São Paulo",
              style: TextStyle(
                fontSize: 24,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'lib/assets/images/developers/henrique.jpeg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Henrique Bissoli Malaman Alonso",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Desenvolveu toda a aplicação",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.dynaPuff().fontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text(
              "Aluno de outra instituição",
              style: TextStyle(
                fontSize: 24,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'lib/assets/images/developers/rafael.jpeg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Rafael de Morais Vieira",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.dynaPuff().fontFamily,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Desenhou todas as imagens do projeto",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: GoogleFonts.dynaPuff().fontFamily,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text(
              "Tecnologias Utilizadas",
              style: TextStyle(
                fontSize: 24,
                fontFamily: GoogleFonts.dynaPuff().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "Flutter",
                      style: TextStyle(
                        fontFamily: GoogleFonts.dynaPuff().fontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    PhosphorIcon(
                      PhosphorIcons.regular.airplane,
                      size: 64.0,
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "Phosphor Icons",
                      style: TextStyle(
                        fontFamily: GoogleFonts.dynaPuff().fontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    PhosphorIcon(
                      PhosphorIcons.regular.phosphorLogo,
                      size: 64.0,
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "Google Fonts",
                      style: TextStyle(
                        fontFamily: GoogleFonts.dynaPuff().fontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    PhosphorIcon(
                      PhosphorIcons.regular.googleLogo,
                      size: 64.0,
                    )
                  ],
                ),
                const Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
