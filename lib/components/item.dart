import 'package:auto_size_text/auto_size_text.dart';
import 'package:dirrocha_ecommerce/components/imageLoader.dart';
import 'package:flutter/material.dart';

Widget item({
  price = '4.99',
  title = "Organic bananas",
  subtitle = "7pcs Priceg",
  imgUrl = "",
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), // Cor da sombra
              blurRadius: 5, // Desfocamento
              offset: const Offset(0, 5), // Deslocamento horizontal e vertical
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:
                  constraints.maxHeight * 0.5, // 50% da altura para a imagem
              width: double.infinity,
              child: loadNetworkImageWithFallback(imgUrl,
                  fit: BoxFit
                      .scaleDown), // Usando a função para carregar a imagem
            ),
            const SizedBox(height: 5),
            AutoSizeText(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.8)),
              maxLines: 1,
              minFontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
            AutoSizeText(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black.withOpacity(0.5),
              ),
              maxLines: 1,
              minFontSize: 10,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "\$$price",
                  style: TextStyle(
                      fontSize: 20, color: Colors.black.withOpacity(.8)),
                  maxLines: 1,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff53B175),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    },
  );
}
