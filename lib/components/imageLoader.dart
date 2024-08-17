import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget loadNetworkImageWithFallback(String imgUrl,
    {String fallbackAsset = 'images/product.png', BoxFit fit = BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: imgUrl,
    fit: fit,
    placeholderFadeInDuration:
        const Duration(milliseconds: 100), // Animação de fade mais rápida
    placeholder: (context, url) => const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth:
              2.0, // Reduz o tamanho do stroke para uma animação mais rápida
        ),
      ),
    ),
    errorWidget: (context, url, error) => Center(
      child: Image.asset(
        fallbackAsset,
        fit: fit,
      ),
    ),
  );
}
