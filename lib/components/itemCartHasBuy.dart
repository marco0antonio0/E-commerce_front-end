import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget itemCartHasBuy(
  double wscreen, {
  text = "Lorem ipsum dolor sit amet",
  subtext = "4.99",
  quantidade = "5",
}) {
  // Limitar o nome a 20 caracteres (ou o valor que preferir)
  String limitedText = text.length > 20 ? text.substring(0, 20) + '...' : text;

  return Center(
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: wscreen,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(top: BorderSide(color: Color(0xffE2E2E2), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
              height: 60,
              width: 60,
              child: Image(image: AssetImage('images/product.png'))),
          const SizedBox(width: 15),
          Align(
            alignment: Alignment.topLeft, // Alinha ao topo e à esquerda
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinha os textos à esquerda
              children: [
                SizedBox(
                  width: wscreen - 100,
                  child: AutoSizeText(
                    limitedText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff181725),
                      fontSize: wscreen >= 700 ? 25 : 20,
                    ),
                    maxLines: 1, // Limita a uma linha
                    minFontSize: 5, // Fonte mínima para responsividade
                    maxFontSize: 25,
                    overflow:
                        TextOverflow.ellipsis, // Indica que o texto foi cortado
                    stepGranularity: 1.0, // Define o passo de redução da fonte
                  ),
                ),
                AutoSizeText('R\$:  $subtext',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black.withOpacity(.6),
                      fontSize: wscreen >= 700 ? 20 : 17,
                    ),
                    maxLines: 1,
                    minFontSize: 14,
                    overflow: TextOverflow.ellipsis),
                AutoSizeText('quantidade:  $quantidade',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black.withOpacity(.6),
                      fontSize: wscreen >= 700 ? 20 : 17,
                    ),
                    maxLines: 1,
                    minFontSize: 14,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 5),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
